; ModuleID = 'test12.bc'
source_filename = "test12.c"
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
define i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !31 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !41, metadata !DIExpression()), !dbg !42
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !43
  ret i32 (i32, i32)* %9, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !45 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !56, metadata !DIExpression()), !dbg !57
  %10 = load i32, i32* %5, align 4, !dbg !58
  %11 = load i32, i32* %6, align 4, !dbg !59
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !60
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !61
  %14 = call i32 (i32, i32)* @foo(i32 %10, i32 %11, i32 (i32, i32)* %12, i32 (i32, i32)* %13), !dbg !62
  store i32 (i32, i32)* %14, i32 (i32, i32)** %9, align 8, !dbg !63
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !64
  %16 = load i32, i32* %5, align 4, !dbg !65
  %17 = load i32, i32* %6, align 4, !dbg !66
  %18 = call i32 %15(i32 %16, i32 %17), !dbg !64
  ret i32 %18, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !68 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !83
  %11 = load i8, i8* %4, align 1, !dbg !84
  %12 = sext i8 %11 to i32, !dbg !84
  %13 = icmp eq i32 %12, 43, !dbg !86
  br i1 %13, label %14, label %16, !dbg !87

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !88
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !90
  br label %23, !dbg !91

16:                                               ; preds = %3
  %17 = load i8, i8* %4, align 1, !dbg !92
  %18 = sext i8 %17 to i32, !dbg !92
  %19 = icmp eq i32 %18, 45, !dbg !94
  br i1 %19, label %20, label %22, !dbg !95

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !96
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !98
  br label %22, !dbg !99

22:                                               ; preds = %20, %16
  br label %23

23:                                               ; preds = %22, %14
  call void @llvm.dbg.declare(metadata i32* %10, metadata !100, metadata !DIExpression()), !dbg !102
  %24 = load i32, i32* %5, align 4, !dbg !103
  %25 = load i32, i32* %6, align 4, !dbg !104
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !105
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !106
  %28 = call i32 @clever(i32 %24, i32 %25, i32 (i32, i32)* %26, i32 (i32, i32)* %27), !dbg !107
  store i32 %28, i32* %10, align 4, !dbg !102
  ret i32 0, !dbg !108
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test12.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
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
!22 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 5, type: !13)
!24 = !DILocation(line: 5, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 5, type: !13)
!26 = !DILocation(line: 5, column: 22, scope: !22)
!27 = !DILocation(line: 6, column: 11, scope: !22)
!28 = !DILocation(line: 6, column: 13, scope: !22)
!29 = !DILocation(line: 6, column: 12, scope: !22)
!30 = !DILocation(line: 6, column: 4, scope: !22)
!31 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !32, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !13, !13, !34, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 9, type: !13)
!36 = !DILocation(line: 9, column: 15, scope: !31)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 9, type: !13)
!38 = !DILocation(line: 9, column: 22, scope: !31)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 9, type: !34)
!40 = !DILocation(line: 9, column: 31, scope: !31)
!41 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !31, file: !1, line: 9, type: !34)
!42 = !DILocation(line: 9, column: 55, scope: !31)
!43 = !DILocation(line: 10, column: 11, scope: !31)
!44 = !DILocation(line: 10, column: 4, scope: !31)
!45 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !46, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!13, !13, !13, !34, !34}
!48 = !DILocalVariable(name: "a", arg: 1, scope: !45, file: !1, line: 13, type: !13)
!49 = !DILocation(line: 13, column: 16, scope: !45)
!50 = !DILocalVariable(name: "b", arg: 2, scope: !45, file: !1, line: 13, type: !13)
!51 = !DILocation(line: 13, column: 23, scope: !45)
!52 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !45, file: !1, line: 13, type: !34)
!53 = !DILocation(line: 13, column: 32, scope: !45)
!54 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !45, file: !1, line: 13, type: !34)
!55 = !DILocation(line: 13, column: 56, scope: !45)
!56 = !DILocalVariable(name: "s_fptr", scope: !45, file: !1, line: 14, type: !34)
!57 = !DILocation(line: 14, column: 10, scope: !45)
!58 = !DILocation(line: 15, column: 17, scope: !45)
!59 = !DILocation(line: 15, column: 20, scope: !45)
!60 = !DILocation(line: 15, column: 23, scope: !45)
!61 = !DILocation(line: 15, column: 31, scope: !45)
!62 = !DILocation(line: 15, column: 13, scope: !45)
!63 = !DILocation(line: 15, column: 11, scope: !45)
!64 = !DILocation(line: 16, column: 11, scope: !45)
!65 = !DILocation(line: 16, column: 18, scope: !45)
!66 = !DILocation(line: 16, column: 21, scope: !45)
!67 = !DILocation(line: 16, column: 4, scope: !45)
!68 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 20, type: !69, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!13, !71, !13, !13}
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "x", arg: 1, scope: !68, file: !1, line: 20, type: !71)
!73 = !DILocation(line: 20, column: 14, scope: !68)
!74 = !DILocalVariable(name: "op1", arg: 2, scope: !68, file: !1, line: 20, type: !13)
!75 = !DILocation(line: 20, column: 21, scope: !68)
!76 = !DILocalVariable(name: "op2", arg: 3, scope: !68, file: !1, line: 20, type: !13)
!77 = !DILocation(line: 20, column: 30, scope: !68)
!78 = !DILocalVariable(name: "a_fptr", scope: !68, file: !1, line: 21, type: !34)
!79 = !DILocation(line: 21, column: 11, scope: !68)
!80 = !DILocalVariable(name: "s_fptr", scope: !68, file: !1, line: 22, type: !34)
!81 = !DILocation(line: 22, column: 11, scope: !68)
!82 = !DILocalVariable(name: "t_fptr", scope: !68, file: !1, line: 23, type: !34)
!83 = !DILocation(line: 23, column: 11, scope: !68)
!84 = !DILocation(line: 25, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !68, file: !1, line: 25, column: 9)
!86 = !DILocation(line: 25, column: 11, scope: !85)
!87 = !DILocation(line: 25, column: 9, scope: !68)
!88 = !DILocation(line: 26, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !1, line: 25, column: 19)
!90 = !DILocation(line: 26, column: 15, scope: !89)
!91 = !DILocation(line: 27, column: 5, scope: !89)
!92 = !DILocation(line: 28, column: 14, scope: !93)
!93 = distinct !DILexicalBlock(scope: !85, file: !1, line: 28, column: 14)
!94 = !DILocation(line: 28, column: 16, scope: !93)
!95 = !DILocation(line: 28, column: 14, scope: !85)
!96 = !DILocation(line: 29, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !1, line: 28, column: 24)
!98 = !DILocation(line: 29, column: 15, scope: !97)
!99 = !DILocation(line: 30, column: 5, scope: !97)
!100 = !DILocalVariable(name: "result", scope: !68, file: !1, line: 32, type: !101)
!101 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!102 = !DILocation(line: 32, column: 14, scope: !68)
!103 = !DILocation(line: 32, column: 30, scope: !68)
!104 = !DILocation(line: 32, column: 35, scope: !68)
!105 = !DILocation(line: 32, column: 40, scope: !68)
!106 = !DILocation(line: 32, column: 48, scope: !68)
!107 = !DILocation(line: 32, column: 23, scope: !68)
!108 = !DILocation(line: 33, column: 5, scope: !68)
