; ModuleID = 'test14.bc'
source_filename = "test14.c"
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
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !43
  ret i32 (i32, i32)* %9, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 (i32, i32)* @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !45 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !52, metadata !DIExpression()), !dbg !53
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !54
  ret i32 (i32, i32)* %9, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !56 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)*, align 8
  %10 = alloca i32 (i32, i32)*, align 8
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)* @foo, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %10, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 (i32, i32)* null, i32 (i32, i32)** %10, align 8, !dbg !74
  %11 = load i8, i8* %4, align 1, !dbg !75
  %12 = sext i8 %11 to i32, !dbg !75
  %13 = icmp eq i32 %12, 43, !dbg !77
  br i1 %13, label %14, label %22, !dbg !78

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)*, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !79
  %16 = load i32, i32* %5, align 4, !dbg !81
  %17 = load i32, i32* %6, align 4, !dbg !82
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !83
  %19 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !84
  %20 = call i32 (i32, i32)* %15(i32 %16, i32 %17, i32 (i32, i32)* %18, i32 (i32, i32)* %19), !dbg !79
  store i32 (i32, i32)* %20, i32 (i32, i32)** %10, align 8, !dbg !85
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !86
  store i32 (i32, i32)* %21, i32 (i32, i32)** %8, align 8, !dbg !87
  br label %23, !dbg !88

22:                                               ; preds = %3
  store i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)* @clever, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !89
  br label %23

23:                                               ; preds = %22, %14
  %24 = load i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)*, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !91
  %25 = load i32, i32* %5, align 4, !dbg !92
  %26 = load i32, i32* %6, align 4, !dbg !93
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !94
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !95
  %29 = call i32 (i32, i32)* %24(i32 %25, i32 %26, i32 (i32, i32)* %27, i32 (i32, i32)* %28), !dbg !91
  store i32 (i32, i32)* %29, i32 (i32, i32)** %10, align 8, !dbg !96
  %30 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !97
  %31 = load i32, i32* %5, align 4, !dbg !98
  %32 = load i32, i32* %6, align 4, !dbg !99
  %33 = call i32 %30(i32 %31, i32 %32), !dbg !97
  ret i32 0, !dbg !100
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test14.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Homebrew clang version 13.0.0"}
!10 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !11, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 2, type: !13)
!15 = !DILocation(line: 2, column: 14, scope: !10)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 2, type: !13)
!17 = !DILocation(line: 2, column: 21, scope: !10)
!18 = !DILocation(line: 3, column: 11, scope: !10)
!19 = !DILocation(line: 3, column: 13, scope: !10)
!20 = !DILocation(line: 3, column: 12, scope: !10)
!21 = !DILocation(line: 3, column: 4, scope: !10)
!22 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 6, type: !13)
!24 = !DILocation(line: 6, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 6, type: !13)
!26 = !DILocation(line: 6, column: 22, scope: !22)
!27 = !DILocation(line: 7, column: 11, scope: !22)
!28 = !DILocation(line: 7, column: 13, scope: !22)
!29 = !DILocation(line: 7, column: 12, scope: !22)
!30 = !DILocation(line: 7, column: 4, scope: !22)
!31 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 10, type: !32, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !13, !13, !34, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 10, type: !13)
!36 = !DILocation(line: 10, column: 15, scope: !31)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 10, type: !13)
!38 = !DILocation(line: 10, column: 22, scope: !31)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 10, type: !34)
!40 = !DILocation(line: 10, column: 31, scope: !31)
!41 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !31, file: !1, line: 10, type: !34)
!42 = !DILocation(line: 10, column: 55, scope: !31)
!43 = !DILocation(line: 11, column: 11, scope: !31)
!44 = !DILocation(line: 11, column: 4, scope: !31)
!45 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !32, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "a", arg: 1, scope: !45, file: !1, line: 13, type: !13)
!47 = !DILocation(line: 13, column: 18, scope: !45)
!48 = !DILocalVariable(name: "b", arg: 2, scope: !45, file: !1, line: 13, type: !13)
!49 = !DILocation(line: 13, column: 25, scope: !45)
!50 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !45, file: !1, line: 13, type: !34)
!51 = !DILocation(line: 13, column: 34, scope: !45)
!52 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !45, file: !1, line: 13, type: !34)
!53 = !DILocation(line: 13, column: 58, scope: !45)
!54 = !DILocation(line: 14, column: 11, scope: !45)
!55 = !DILocation(line: 14, column: 4, scope: !45)
!56 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 16, type: !57, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!13, !59, !13, !13}
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "x", arg: 1, scope: !56, file: !1, line: 16, type: !59)
!61 = !DILocation(line: 16, column: 14, scope: !56)
!62 = !DILocalVariable(name: "op1", arg: 2, scope: !56, file: !1, line: 16, type: !13)
!63 = !DILocation(line: 16, column: 21, scope: !56)
!64 = !DILocalVariable(name: "op2", arg: 3, scope: !56, file: !1, line: 16, type: !13)
!65 = !DILocation(line: 16, column: 30, scope: !56)
!66 = !DILocalVariable(name: "a_fptr", scope: !56, file: !1, line: 17, type: !34)
!67 = !DILocation(line: 17, column: 11, scope: !56)
!68 = !DILocalVariable(name: "s_fptr", scope: !56, file: !1, line: 18, type: !34)
!69 = !DILocation(line: 18, column: 11, scope: !56)
!70 = !DILocalVariable(name: "goo_ptr", scope: !56, file: !1, line: 19, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!72 = !DILocation(line: 19, column: 14, scope: !56)
!73 = !DILocalVariable(name: "t_fptr", scope: !56, file: !1, line: 20, type: !34)
!74 = !DILocation(line: 20, column: 11, scope: !56)
!75 = !DILocation(line: 22, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !56, file: !1, line: 22, column: 8)
!77 = !DILocation(line: 22, column: 10, scope: !76)
!78 = !DILocation(line: 22, column: 8, scope: !56)
!79 = !DILocation(line: 24, column: 18, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 23, column: 5)
!81 = !DILocation(line: 24, column: 26, scope: !80)
!82 = !DILocation(line: 24, column: 31, scope: !80)
!83 = !DILocation(line: 24, column: 36, scope: !80)
!84 = !DILocation(line: 24, column: 44, scope: !80)
!85 = !DILocation(line: 24, column: 16, scope: !80)
!86 = !DILocation(line: 25, column: 16, scope: !80)
!87 = !DILocation(line: 25, column: 15, scope: !80)
!88 = !DILocation(line: 26, column: 5, scope: !80)
!89 = !DILocation(line: 28, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !76, file: !1, line: 27, column: 5)
!91 = !DILocation(line: 31, column: 14, scope: !56)
!92 = !DILocation(line: 31, column: 22, scope: !56)
!93 = !DILocation(line: 31, column: 27, scope: !56)
!94 = !DILocation(line: 31, column: 32, scope: !56)
!95 = !DILocation(line: 31, column: 40, scope: !56)
!96 = !DILocation(line: 31, column: 12, scope: !56)
!97 = !DILocation(line: 32, column: 5, scope: !56)
!98 = !DILocation(line: 32, column: 12, scope: !56)
!99 = !DILocation(line: 32, column: 17, scope: !56)
!100 = !DILocation(line: 34, column: 5, scope: !56)
