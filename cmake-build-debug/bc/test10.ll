; ModuleID = 'test10.bc'
source_filename = "test10.c"
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
define i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !31 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !43, metadata !DIExpression()), !dbg !44
  %10 = load i32, i32* %5, align 4, !dbg !45
  %11 = icmp sgt i32 %10, 0, !dbg !47
  br i1 %11, label %12, label %14, !dbg !48

12:                                               ; preds = %4
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !49
  store i32 (i32, i32)* %13, i32 (i32, i32)** %9, align 8, !dbg !50
  br label %16, !dbg !51

14:                                               ; preds = %4
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !52
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !53
  br label %16

16:                                               ; preds = %14, %12
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !54
  %18 = load i32, i32* %5, align 4, !dbg !55
  %19 = load i32, i32* %6, align 4, !dbg !56
  %20 = call i32 %17(i32 %18, i32 %19), !dbg !54
  ret i32 %20, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !58 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !65, metadata !DIExpression()), !dbg !66
  %9 = load i32, i32* %5, align 4, !dbg !67
  %10 = load i32, i32* %6, align 4, !dbg !68
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !69
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !70
  %13 = call i32 @foo(i32 %9, i32 %10, i32 (i32, i32)* %11, i32 (i32, i32)* %12), !dbg !71
  ret i32 %13, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !73 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !88
  %11 = load i8, i8* %4, align 1, !dbg !89
  %12 = sext i8 %11 to i32, !dbg !89
  %13 = icmp eq i32 %12, 43, !dbg !91
  br i1 %13, label %14, label %16, !dbg !92

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !93
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !95
  br label %23, !dbg !96

16:                                               ; preds = %3
  %17 = load i8, i8* %4, align 1, !dbg !97
  %18 = sext i8 %17 to i32, !dbg !97
  %19 = icmp eq i32 %18, 45, !dbg !99
  br i1 %19, label %20, label %22, !dbg !100

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !101
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !103
  br label %22, !dbg !104

22:                                               ; preds = %20, %16
  br label %23

23:                                               ; preds = %22, %14
  call void @llvm.dbg.declare(metadata i32* %10, metadata !105, metadata !DIExpression()), !dbg !107
  %24 = load i32, i32* %5, align 4, !dbg !108
  %25 = load i32, i32* %6, align 4, !dbg !109
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !110
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !111
  %28 = call i32 @clever(i32 %24, i32 %25, i32 (i32, i32)* %26, i32 (i32, i32)* %27), !dbg !112
  store i32 %28, i32* %10, align 4, !dbg !107
  ret i32 0, !dbg !113
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test10.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
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
!33 = !{!13, !13, !13, !34, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 9, type: !13)
!36 = !DILocation(line: 9, column: 13, scope: !31)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 9, type: !13)
!38 = !DILocation(line: 9, column: 20, scope: !31)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 9, type: !34)
!40 = !DILocation(line: 9, column: 29, scope: !31)
!41 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !31, file: !1, line: 9, type: !34)
!42 = !DILocation(line: 9, column: 53, scope: !31)
!43 = !DILocalVariable(name: "s_fptr", scope: !31, file: !1, line: 10, type: !34)
!44 = !DILocation(line: 10, column: 10, scope: !31)
!45 = !DILocation(line: 11, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !1, line: 11, column: 8)
!47 = !DILocation(line: 11, column: 10, scope: !46)
!48 = !DILocation(line: 11, column: 8, scope: !31)
!49 = !DILocation(line: 12, column: 16, scope: !46)
!50 = !DILocation(line: 12, column: 14, scope: !46)
!51 = !DILocation(line: 12, column: 7, scope: !46)
!52 = !DILocation(line: 14, column: 16, scope: !46)
!53 = !DILocation(line: 14, column: 14, scope: !46)
!54 = !DILocation(line: 15, column: 11, scope: !31)
!55 = !DILocation(line: 15, column: 18, scope: !31)
!56 = !DILocation(line: 15, column: 21, scope: !31)
!57 = !DILocation(line: 15, column: 4, scope: !31)
!58 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !32, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "a", arg: 1, scope: !58, file: !1, line: 18, type: !13)
!60 = !DILocation(line: 18, column: 16, scope: !58)
!61 = !DILocalVariable(name: "b", arg: 2, scope: !58, file: !1, line: 18, type: !13)
!62 = !DILocation(line: 18, column: 23, scope: !58)
!63 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !58, file: !1, line: 18, type: !34)
!64 = !DILocation(line: 18, column: 32, scope: !58)
!65 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !58, file: !1, line: 18, type: !34)
!66 = !DILocation(line: 18, column: 56, scope: !58)
!67 = !DILocation(line: 19, column: 16, scope: !58)
!68 = !DILocation(line: 19, column: 19, scope: !58)
!69 = !DILocation(line: 19, column: 22, scope: !58)
!70 = !DILocation(line: 19, column: 30, scope: !58)
!71 = !DILocation(line: 19, column: 12, scope: !58)
!72 = !DILocation(line: 19, column: 5, scope: !58)
!73 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 23, type: !74, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!13, !76, !13, !13}
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "x", arg: 1, scope: !73, file: !1, line: 23, type: !76)
!78 = !DILocation(line: 23, column: 14, scope: !73)
!79 = !DILocalVariable(name: "op1", arg: 2, scope: !73, file: !1, line: 23, type: !13)
!80 = !DILocation(line: 23, column: 21, scope: !73)
!81 = !DILocalVariable(name: "op2", arg: 3, scope: !73, file: !1, line: 23, type: !13)
!82 = !DILocation(line: 23, column: 30, scope: !73)
!83 = !DILocalVariable(name: "a_fptr", scope: !73, file: !1, line: 24, type: !34)
!84 = !DILocation(line: 24, column: 11, scope: !73)
!85 = !DILocalVariable(name: "s_fptr", scope: !73, file: !1, line: 25, type: !34)
!86 = !DILocation(line: 25, column: 11, scope: !73)
!87 = !DILocalVariable(name: "t_fptr", scope: !73, file: !1, line: 26, type: !34)
!88 = !DILocation(line: 26, column: 11, scope: !73)
!89 = !DILocation(line: 28, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !73, file: !1, line: 28, column: 9)
!91 = !DILocation(line: 28, column: 11, scope: !90)
!92 = !DILocation(line: 28, column: 9, scope: !73)
!93 = !DILocation(line: 29, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 28, column: 19)
!95 = !DILocation(line: 29, column: 15, scope: !94)
!96 = !DILocation(line: 30, column: 5, scope: !94)
!97 = !DILocation(line: 31, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !90, file: !1, line: 31, column: 14)
!99 = !DILocation(line: 31, column: 16, scope: !98)
!100 = !DILocation(line: 31, column: 14, scope: !90)
!101 = !DILocation(line: 32, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 31, column: 24)
!103 = !DILocation(line: 32, column: 15, scope: !102)
!104 = !DILocation(line: 33, column: 5, scope: !102)
!105 = !DILocalVariable(name: "result", scope: !73, file: !1, line: 35, type: !106)
!106 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!107 = !DILocation(line: 35, column: 14, scope: !73)
!108 = !DILocation(line: 35, column: 30, scope: !73)
!109 = !DILocation(line: 35, column: 35, scope: !73)
!110 = !DILocation(line: 35, column: 40, scope: !73)
!111 = !DILocation(line: 35, column: 48, scope: !73)
!112 = !DILocation(line: 35, column: 23, scope: !73)
!113 = !DILocation(line: 36, column: 5, scope: !73)
