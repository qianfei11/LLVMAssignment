; ModuleID = 'test00.bc'
source_filename = "test00.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !10 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !16, metadata !DIExpression()), !dbg !17
  %5 = load i32, i32* %3, align 4, !dbg !18
  %6 = load i32, i32* %4, align 4, !dbg !19
  %7 = add nsw i32 %5, %6, !dbg !20
  ret i32 %7, !dbg !21
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever() #0 !dbg !22 {
  %1 = alloca i32 (i32, i32)*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %1, metadata !25, metadata !DIExpression()), !dbg !27
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %2, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 1, i32* %2, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 2, i32* %3, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %4, metadata !32, metadata !DIExpression()), !dbg !34
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %1, align 8, !dbg !35
  %6 = load i32, i32* %2, align 4, !dbg !36
  %7 = load i32, i32* %3, align 4, !dbg !37
  %8 = call i32 %5(i32 %6, i32 %7), !dbg !35
  store i32 %8, i32* %4, align 4, !dbg !34
  ret i32 0, !dbg !38
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test00.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Homebrew clang version 13.0.0"}
!10 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 1, type: !11, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 1, type: !13)
!15 = !DILocation(line: 1, column: 14, scope: !10)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 1, type: !13)
!17 = !DILocation(line: 1, column: 21, scope: !10)
!18 = !DILocation(line: 2, column: 11, scope: !10)
!19 = !DILocation(line: 2, column: 13, scope: !10)
!20 = !DILocation(line: 2, column: 12, scope: !10)
!21 = !DILocation(line: 2, column: 4, scope: !10)
!22 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 5, type: !23, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!13}
!25 = !DILocalVariable(name: "a_fptr", scope: !22, file: !1, line: 6, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!27 = !DILocation(line: 6, column: 11, scope: !22)
!28 = !DILocalVariable(name: "op1", scope: !22, file: !1, line: 8, type: !13)
!29 = !DILocation(line: 8, column: 9, scope: !22)
!30 = !DILocalVariable(name: "op2", scope: !22, file: !1, line: 8, type: !13)
!31 = !DILocation(line: 8, column: 18, scope: !22)
!32 = !DILocalVariable(name: "result", scope: !22, file: !1, line: 10, type: !33)
!33 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 10, column: 14, scope: !22)
!35 = !DILocation(line: 10, column: 23, scope: !22)
!36 = !DILocation(line: 10, column: 30, scope: !22)
!37 = !DILocation(line: 10, column: 35, scope: !22)
!38 = !DILocation(line: 11, column: 5, scope: !22)
