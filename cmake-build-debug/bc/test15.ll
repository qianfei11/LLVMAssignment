; ModuleID = 'test15.bc'
source_filename = "test15.c"
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
define i32 @minus(i32 %0, i32 %1) #0 !dbg !22 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !25, metadata !DIExpression()), !dbg !26
  %5 = load i32, i32* %3, align 4, !dbg !27
  %6 = load i32, i32* %4, align 4, !dbg !28
  %7 = sub nsw i32 %5, %6, !dbg !29
  ret i32 %7, !dbg !30
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !31 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !39, metadata !DIExpression()), !dbg !40
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !41
  %8 = load i32, i32* %4, align 4, !dbg !42
  %9 = load i32, i32* %5, align 4, !dbg !43
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !41
  ret i32 %10, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @moo(i8 signext %0) #0 !dbg !45 {
  %2 = alloca i8, align 1
  %3 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  store i8 %0, i8* %2, align 1
  call void @llvm.dbg.declare(metadata i8* %2, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %3, metadata !51, metadata !DIExpression()), !dbg !53
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 (i32, i32)* null, i32 (i32, i32)** %4, align 8, !dbg !55
  %5 = load i8, i8* %2, align 1, !dbg !56
  %6 = sext i8 %5 to i32, !dbg !56
  %7 = icmp eq i32 %6, 43, !dbg !58
  br i1 %7, label %8, label %12, !dbg !59

8:                                                ; preds = %1
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %4, align 8, !dbg !60
  %9 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !62
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !63
  %11 = call i32 %9(i32 1, i32 2, i32 (i32, i32)* %10), !dbg !62
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !64
  br label %12, !dbg !65

12:                                               ; preds = %8, %1
  %13 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !66
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !67
  %15 = call i32 %13(i32 1, i32 2, i32 (i32, i32)* %14), !dbg !66
  ret i32 0, !dbg !68
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test15.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Homebrew clang version 13.0.0"}
!10 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 3, type: !13)
!15 = !DILocation(line: 3, column: 14, scope: !10)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 3, type: !13)
!17 = !DILocation(line: 3, column: 21, scope: !10)
!18 = !DILocation(line: 4, column: 11, scope: !10)
!19 = !DILocation(line: 4, column: 13, scope: !10)
!20 = !DILocation(line: 4, column: 12, scope: !10)
!21 = !DILocation(line: 4, column: 4, scope: !10)
!22 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 7, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 7, type: !13)
!24 = !DILocation(line: 7, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 7, type: !13)
!26 = !DILocation(line: 7, column: 21, scope: !22)
!27 = !DILocation(line: 9, column: 12, scope: !22)
!28 = !DILocation(line: 9, column: 14, scope: !22)
!29 = !DILocation(line: 9, column: 13, scope: !22)
!30 = !DILocation(line: 9, column: 5, scope: !22)
!31 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 12, type: !32, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!13, !13, !13, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 12, type: !13)
!36 = !DILocation(line: 12, column: 13, scope: !31)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 12, type: !13)
!38 = !DILocation(line: 12, column: 19, scope: !31)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 12, type: !34)
!40 = !DILocation(line: 12, column: 27, scope: !31)
!41 = !DILocation(line: 14, column: 12, scope: !31)
!42 = !DILocation(line: 14, column: 19, scope: !31)
!43 = !DILocation(line: 14, column: 21, scope: !31)
!44 = !DILocation(line: 14, column: 5, scope: !31)
!45 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 18, type: !46, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!13, !48}
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "x", arg: 1, scope: !45, file: !1, line: 18, type: !48)
!50 = !DILocation(line: 18, column: 14, scope: !45)
!51 = !DILocalVariable(name: "af_ptr", scope: !45, file: !1, line: 20, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!53 = !DILocation(line: 20, column: 11, scope: !45)
!54 = !DILocalVariable(name: "pf_ptr", scope: !45, file: !1, line: 21, type: !34)
!55 = !DILocation(line: 21, column: 11, scope: !45)
!56 = !DILocation(line: 22, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !45, file: !1, line: 22, column: 8)
!58 = !DILocation(line: 22, column: 10, scope: !57)
!59 = !DILocation(line: 22, column: 8, scope: !45)
!60 = !DILocation(line: 23, column: 15, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 22, column: 17)
!62 = !DILocation(line: 24, column: 9, scope: !61)
!63 = !DILocation(line: 24, column: 20, scope: !61)
!64 = !DILocation(line: 25, column: 15, scope: !61)
!65 = !DILocation(line: 26, column: 5, scope: !61)
!66 = !DILocation(line: 27, column: 5, scope: !45)
!67 = !DILocation(line: 27, column: 16, scope: !45)
!68 = !DILocation(line: 28, column: 5, scope: !45)
