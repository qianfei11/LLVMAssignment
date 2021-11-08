#include <llvm/Support/CommandLine.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/ToolOutputFile.h>

#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Utils.h>

#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Support/raw_ostream.h>

#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>

#include <sys/time.h>

#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/InstrTypes.h>

#include <llvm/ADT/DepthFirstIterator.h>
#include <llvm/IR/CFG.h>

using namespace std;
using namespace llvm;

enum LOG_LEVEL {
    LOG_LEVEL_OFF = -3,
    LOG_LEVEL_ERROR = -2,
    LOG_LEVEL_WARN = -1,
    LOG_LEVEL_INFO = 0,
    LOG_LEVEL_DEBUG = 1,
    LOG_LEVEL_COLOR = 2,
    LOG_LEVEL_ALL = 3,
};

#define LOG_DEBUG(format,...) \
do { \
 	if (log_level >= LOG_LEVEL_DEBUG) {	\
        get_sys_time();	\
        printf("[%20s] [%6d] [DEBUG] " format "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
    }	\
} while(0)
#define LOG_COLOR(expr) \
do { \
    if (log_level >= LOG_LEVEL_COLOR) { \
        expr->dumpColor(); \
    } \
} while (0)
#define LOG_INFO(format,...) \
do { \
    if (log_level >= LOG_LEVEL_INFO) {	\
	    get_sys_time();	\
    	printf("[%20s] [%6d] [INFO ] " format "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
	}	\
} while(0)
#define LOG_WARN(format,...) \
do { \
    if (log_level >= LOG_LEVEL_WARN) {	\
	    get_sys_time();	\
    	printf("[%20s] [%6d] [WARN ] " format "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
	}	\
} while(0)
#define LOG_ERROR(format,...) \
do { \
    if (log_level >= LOG_LEVEL_ERROR) {	\
	    get_sys_time();	\
    	printf("[%20s] [%6d] [ERROR] " format "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
	}	\
} while(0)

int log_level = LOG_LEVEL_OFF;

void get_sys_time() {
    struct timeval tv{};
    struct tm *tm_ptr;
    gettimeofday(&tv, nullptr);
    tm_ptr = localtime(&tv.tv_sec);
    printf("[%d-%02d-%02d %02d:%02d:%02d.%d] ", 1900+tm_ptr->tm_year, 1+tm_ptr->tm_mon,
           tm_ptr->tm_mday, tm_ptr->tm_hour, tm_ptr->tm_min, tm_ptr->tm_sec, tv.tv_usec/1000);
}

#define RED(s) "\033[31;4m"#s"\033[0m"

static ManagedStatic<LLVMContext> GlobalContext;
static LLVMContext &getGlobalContext() { return *GlobalContext; }

/* In LLVM 5.0, when  -O0 passed to clang , the functions generated with clang will
 * have optnone attribute which would lead to some transform passes disabled, like mem2reg.
 */
struct EnableFunctionOptPass: public FunctionPass {
    static char ID;
    EnableFunctionOptPass():FunctionPass(ID){}
    bool runOnFunction(Function & F) override{
        if(F.hasFnAttribute(Attribute::OptimizeNone))
        {
            F.removeFnAttr(Attribute::OptimizeNone);
        }
        return true;
    }
};

char EnableFunctionOptPass::ID=0;

///!TODO TO BE COMPLETED BY YOU FOR ASSIGNMENT 2
///Updated 11/10/2017 by fargo: make all functions
///processed by mem2reg before this pass.
struct FuncPtrPass : public ModulePass {
    static char ID; // Pass identification, replacement for typeid
    FuncPtrPass() : ModulePass(ID) {}
    map<int, vector<string>> results;
    vector<string> funcNames;

    bool runOnModule(Module &M) override {
//        M.print(errs(), nullptr);
        /* remove dead blocks */
        for (Module::iterator funcIt = M.begin(); funcIt != M.end(); funcIt++) {
            if (funcIt->isDeclaration()) {
                continue;
            } else {
                LOG_DEBUG("clean dead block in function %s\n", funcIt->getName().data());
                /* traverse basic blocks in function */
                for (Function::iterator blockIt = funcIt->begin(); blockIt != funcIt->end(); blockIt++) {
                    if (dyn_cast<DbgInfoIntrinsic>(&*blockIt)) {
                        continue;
                    } else {
                        LOG_DEBUG("traverse basic block %s\n", blockIt->getName().data());
                        /* traverse instructions in basic block */
                        for (BasicBlock::iterator instIt = blockIt->begin(); instIt != blockIt->end(); instIt++) {
                            LOG_DEBUG("traverse instruction %s\n", instIt->getName().data());
                            auto *inst = dyn_cast<Instruction>(instIt);
                            if (auto * phiNode = dyn_cast<PHINode>(inst)) {
                                removeDeadPHINode(phiNode);
                                break;
                            } else {
                                LOG_DEBUG("TODO\n");
                            }
                        }
                    }
                }
            }
        }
//        M.print(errs(), nullptr);
        LOG_DEBUG("traverse module %s\n", M.getName().data());
        /* traverse functions in module */
        for (Module::iterator funcIt = M.begin(); funcIt != M.end(); funcIt++) {
            LOG_DEBUG("traverse function %s\n", funcIt->getName().data());
            if (funcIt->isDeclaration()) {
                continue;
            } else {
                /* traverse basic blocks in function */
                for (Function::iterator blockIt = funcIt->begin(); blockIt != funcIt->end(); blockIt++) {
                    if (dyn_cast<DbgInfoIntrinsic>(&*blockIt)) {
                        continue;
                    } else {
                        LOG_DEBUG("traverse basic block %s\n", blockIt->getName().data());
                        /* traverse instructions in basic block */
                        for (BasicBlock::iterator instIt = blockIt->begin(); instIt != blockIt->end(); instIt++) {
                            LOG_DEBUG("traverse instruction %s\n", instIt->getName().data());
                            auto *inst = dyn_cast<Instruction>(instIt);
                            if (auto * callInst = dyn_cast<CallInst>(inst)) {
                                LOG_DEBUG("call getResult()\n");
                                getResult(callInst);
                            } else {
                                LOG_DEBUG("TODO\n");
                            }
                        }
                    }
                }
            }
        }
        printResult();
        return false;
    }

    void parseValue(Value * value) {
        if (auto * phiNode = dyn_cast<PHINode>(value)) {
            LOG_DEBUG("parseValue - PHINode\n");
            parsePHINode(phiNode);
        } else if (auto * function = dyn_cast<Function>(value)) {
            LOG_DEBUG("parseValue - Function\n");
            string funcName = function->getName().data();
            if (find(funcNames.begin(), funcNames.end(), funcName) == funcNames.end()) {
                LOG_DEBUG("push %s\n", funcName.c_str());
                funcNames.push_back(funcName);
            } else {
                LOG_DEBUG("TODO\n");
            }
        } else if (auto * argument = dyn_cast<Argument>(value)) {
            LOG_DEBUG("parseValue - Argument\n");
            parseArgument(argument);
        } else {
            LOG_DEBUG("TODO");
        }
    }

    void parseArgument(Argument * argument) {
        unsigned int argIdx = argument->getArgNo();
        Function * funcParent = argument->getParent();
        for (User * funcUser : funcParent->users()) {
            if (auto * callInst = dyn_cast<CallInst>(funcUser)) {
                if (argIdx + 1 <= callInst->getNumArgOperands()) {
                    Value * value = callInst->getArgOperand(argIdx);
                    if (callInst->getCalledFunction() != funcParent) {
                        LOG_DEBUG("start recursion\n");
                        Function * func = callInst->getCalledFunction();
                        /* traverse basic blocks in function */
                        for (Function::iterator blockIt = func->begin(); blockIt != func->end(); blockIt++) {
                            /* traverse instructions in basic block */
                            for (BasicBlock::iterator instIt = blockIt->begin(); instIt != blockIt->end(); instIt++) {
                                auto *inst = dyn_cast<Instruction>(instIt);
                                if (auto * retInst = dyn_cast<ReturnInst>(inst)) {
                                    Value * retVal = retInst->getReturnValue();
                                    if (auto * call = dyn_cast<CallInst>(retVal)) {
                                        Value * argVal = call->getArgOperand(argIdx);
                                        if (auto * arg = dyn_cast<Argument>(argVal)) {
                                            parseArgument(arg);
                                        } else {
                                            LOG_DEBUG("TODO\n");
                                        }
                                    } else {
                                        LOG_DEBUG("TODO\n");
                                    }
                                } else {
                                    LOG_DEBUG("TODO\n");
                                }
                            }
                        }
                    } else {
                        parseValue(value);
                    }
                } else {
                    LOG_DEBUG("TODO\n");
                }
            } else if (auto * phiNode = dyn_cast<PHINode>(funcUser)) {
                for (User * phiUser : phiNode->users()) {
                    if (auto * call = dyn_cast<CallInst>(phiUser)) {
                        if (argIdx + 1 <= call->getNumArgOperands()) {
                            Value * value = call->getArgOperand(argIdx);
                            parseValue(value);
                        } else {
                            LOG_DEBUG("TODO\n");
                        }
                    } else {
                        LOG_DEBUG("TODO\n");
                    }
                }
            } else {
                LOG_DEBUG("TODO\n");
            }
        }
    }

    /* https://opensource.apple.com/source/clang/clang-700.1.76/src/lib/CodeGen/UnreachableBlockElim.cpp.auto.html */
    void removeDeadPHINode(PHINode * phiNode) {
        LOG_DEBUG("start remove dead block in phinode\n");
        vector<BasicBlock *> unreachableBlock;
        vector<Instruction *> targetInst;
        LOG_DEBUG("count of block = %d\n", phiNode->getNumOperands());
        for (auto BB = phiNode->block_begin(); BB != phiNode->block_end(); BB++) {
            if (auto * prevBB = (*BB)->getSinglePredecessor()) {
                for (auto inst = prevBB->begin(); inst != prevBB->end(); inst++) {
                    if (auto * branch = dyn_cast<BranchInst>(inst)) {
                        if (branch->isConditional()) {
                            auto * cond = branch->getCondition();
                            if (auto * cmp = dyn_cast<ICmpInst>(cond)) {
                                /* start comparison */
                                Value * valA = cmp->getOperand(0);
                                Value * valB = cmp->getOperand(1);
                                if (valA && valB) {
                                    auto * constA = dyn_cast<ConstantInt>(valA);
                                    auto * constB = dyn_cast<ConstantInt>(valB);
                                    if (constA && constB) {
                                        long long A = constA->getSExtValue();
                                        long long B = constB->getSExtValue();
                                        LOG_DEBUG("start comparison\n");
                                        if (cmp->getPredicate() == llvm::CmpInst::ICMP_SGT) {
                                            if (A > B) {
                                                BasicBlock * BBToDel = *(BB+1);
                                                unreachableBlock.push_back(BBToDel);
//                                                BBToDel->print(errs(), nullptr);
                                                while (PHINode * PH = dyn_cast<PHINode>(BBToDel->begin())) {
                                                    PH->replaceAllUsesWith(Constant::getNullValue(PH->getType()));
                                                    BBToDel->getInstList().pop_front();
//                                                    BBToDel->print(errs(), nullptr);
                                                }
                                                for (succ_iterator SI = succ_begin(BBToDel); SI != succ_end(BBToDel); SI++) {
                                                    (*SI)->removePredecessor(BBToDel);
                                                }
//                                                BBToDel->dropAllReferences();
                                                LOG_DEBUG("add to unreachable block\n");
                                            } else {
                                                BasicBlock * BBToDel = *BB;
                                                unreachableBlock.push_back(BBToDel);
//                                                BBToDel->print(errs(), nullptr);
                                                while (PHINode * PH = dyn_cast<PHINode>(BBToDel->begin())) {
                                                    PH->replaceAllUsesWith(Constant::getNullValue(PH->getType()));
                                                    BBToDel->getInstList().pop_front();
//                                                    BBToDel->print(errs(), nullptr);
                                                }
                                                for (succ_iterator SI = succ_begin(BBToDel); SI != succ_end(BBToDel); SI++) {
                                                    (*SI)->removePredecessor(BBToDel);
                                                }
//                                                BBToDel->dropAllReferences();
                                                LOG_DEBUG("add to unreachable block\n");
                                            }
                                        } else {
                                            LOG_DEBUG("TODO\n");
                                        }
                                    } else {
                                        LOG_DEBUG("no constant value\n");
                                    }
                                } else {
                                    LOG_DEBUG("no binary operator\n");
                                }
                            } else {
                                LOG_DEBUG("no comparison");
                            }
                        } else {
                            LOG_DEBUG("no condition\n");
                        }
                    } else {
                        LOG_DEBUG("no branch\n");
                    }
                }
                break;
            } else {
                LOG_DEBUG("no prev block\n");
            }
        }
        LOG_DEBUG("unreachable size = %lu\n", unreachableBlock.size());
        for (auto i = 0; i < unreachableBlock.size(); i++) {
            LOG_DEBUG("removed basic block %d\n", i);
//            unreachableBlock[i]->eraseFromParent();
            LOG_DEBUG("count of inst = %lu\n", unreachableBlock[i]->getInstList().size());
            for (auto it = unreachableBlock[i]->begin(); it != unreachableBlock[i]->end(); it++) {
                Instruction * I = &*it;
                std::string str;
                llvm::raw_string_ostream(str) << *I;
//                if (auto * branch = dyn_cast<BranchInst>(I)) {
//                    LOG_DEBUG("branch\n");
//                } else {
                    LOG_DEBUG("to erase: I = %s\n", str.c_str());
                    targetInst.push_back(I);
//                }
            }
        }
//        for (auto i = 0; i < unreachableBlock.size(); i++) {
//            unreachableBlock[i]->print(errs(), nullptr);
//        }
        for (auto i = 0; i < targetInst.size(); i++) {
            Instruction * I = targetInst[i];
            /* https://stackoverflow.com/questions/32654709/replace-all-uses-of-an-instruction-to-delete-with-an-undef-value-at-llvm */
            I->replaceAllUsesWith(UndefValue::get(I->getType()));
            I->eraseFromParent();
        }
//        for (auto i = 0; i < unreachableBlock.size(); i++) {
//            unreachableBlock[i]->print(errs(), nullptr);
//        }
        LOG_DEBUG("remove successfully\n");
    }

    void parsePHINode(PHINode * phiNode) {
//        removeDeadPHINode(phiNode);
        for (Value * value : phiNode->incoming_values()) {
            if (auto func = dyn_cast<Function>(value)) {
                LOG_DEBUG("parsePHINode - Function\n");
                string funcName = func->getName().data();
                if (find(funcNames.begin(), funcNames.end(), funcName) == funcNames.end()) {
                    LOG_DEBUG("push %s\n", funcName.c_str());
                    funcNames.push_back(funcName);
                } else {
                    LOG_DEBUG("TODO\n");
                }
            } else if (auto phi = dyn_cast<PHINode>(value)) {
                LOG_DEBUG("parsePHINode - PHINode\n");
                parsePHINode(phi);
            } else if (auto argument = dyn_cast<Argument>(value)) {
                LOG_DEBUG("parsePHINode - Argument\n");
                parseArgument(argument);
            } else {
                LOG_DEBUG("TODO\n");
            }
        }
    }

    void parseFunction(Function * func) {
        /* traverse basic blocks in function */
        for (Function::iterator blockIt = func->begin(); blockIt != func->end(); blockIt++) {
            /* traverse instructions in basic block */
            for (BasicBlock::iterator instIt = blockIt->begin(); instIt != blockIt->end(); instIt++) {
                auto *inst = dyn_cast<Instruction>(instIt);
                if (auto * retInst = dyn_cast<ReturnInst>(inst)) {
                    Value * retVal = retInst->getReturnValue();
                    if (auto * callInst = dyn_cast<CallInst>(retVal)) {
                        parseCall(callInst);
                    } else if (auto * phiNode = dyn_cast<PHINode>(retVal)) {
                        parsePHINode(phiNode);
                    } else if (auto * argument = dyn_cast<Argument>(retVal)) {
                        parseArgument(argument);
                    } else {
                        LOG_DEBUG("TODO\n");
                    }
                } else {
                    LOG_DEBUG("TODO\n");
                }
            }
        }
    }

    void parseCall(CallInst * callInst) {
        Function * func = callInst->getCalledFunction();
        if (func) {
            parseFunction(func);
        } else {
            Value * val = callInst->getCalledOperand();
            if (auto * phiNode = dyn_cast<PHINode>(val)) {
                for (Value * value : phiNode->incoming_values()) {
                    if (auto * function = dyn_cast<Function>(value)) {
                        parseFunction(function);
                    } else {
                        LOG_DEBUG("TODO\n");
                    }
                }
            } else {
                LOG_DEBUG("TODO\n");
            }
        }
    }

    void getResult(CallInst * callInst) {
        Function * func = callInst->getCalledFunction();
        unsigned int line = callInst->getDebugLoc().getLine();
        LOG_DEBUG("line = %u\n", line);
        funcNames.clear();
        if (func) { /* call function exists */
            string funcName = func->getName().data();
            if (funcName == "llvm.dbg.value") {
                LOG_DEBUG("TODO\n");
            } else {
                LOG_DEBUG("function %s\n", funcName.c_str());
                if (find(funcNames.begin(), funcNames.end(), funcName) == funcNames.end()) {
                    LOG_DEBUG("push %s\n", funcName.c_str());
                    funcNames.push_back(funcName);
                } else {
                    LOG_DEBUG("TODO\n");
                }
                if (results.find(line) == results.end()) {
                    results.insert(pair<int, vector<string>>(line, funcNames));
                } else {
                    auto i = results.find(line);
                    i->second.push_back(funcName);
                }
            }
        } else { /* handle different situation */
            /* https://reviews.llvm.org/D78882 */
            Value * value = callInst->getCalledOperand();
            if (auto * phiNode = dyn_cast<PHINode>(value)) { /* if else */
                LOG_DEBUG("PHINode\n");
                parsePHINode(phiNode);
            } else if (auto * argument = dyn_cast<Argument>(value)) {
                LOG_DEBUG("Argument\n");
                parseArgument(argument);
            } else if (auto * call = dyn_cast<CallInst>(value)) {
                LOG_DEBUG("CallInst\n");
                parseCall(call);
            } else {
                LOG_DEBUG("TODO\n");
            }
            results.insert(pair<int, vector<string>>(line, funcNames));
        }
    }

    void printResult() {
        for (auto i = results.begin(); i != results.end(); i++) {
            if (i->second.empty()) {
                continue;
            } else {
                errs() << i->first << " : ";
                for (auto j = i->second.begin(); j != i->second.end(); j++) {
                    errs() << *j;
                    if (j == i->second.end() - 1) {
                        continue;
                    } else {
                        errs() << ", ";
                    }
                }
                errs() << "\n";
            }
        }
    }
};

char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

static cl::opt<std::string>
        InputFilename(cl::Positional,
                      cl::desc("<filename>.bc"),
                      cl::init(""));

int main(int argc, char **argv) {
    LLVMContext &Context = getGlobalContext();
    SMDiagnostic Err;
    // Parse the command line to read the Inputfilename
    cl::ParseCommandLineOptions(argc, argv,
                                "FuncPtrPass \n My first LLVM too which does not do much.\n");

    // Load the input module
    std::unique_ptr<Module> M = parseIRFile(InputFilename, Err, Context);
    if (!M) {
        Err.print(argv[0], errs());
        return 1;
    }

    llvm::legacy::PassManager Passes;

    ///Remove functions' optnone attribute in LLVM5.0
    Passes.add(new EnableFunctionOptPass());
    ///Transform it to SSA
    Passes.add(llvm::createPromoteMemoryToRegisterPass());

    /// Your pass to print Function and Call Instructions
    Passes.add(new FuncPtrPass());
    Passes.run(*M.get());
}
