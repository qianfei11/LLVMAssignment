; ModuleID = 'test09.bc'
source_filename = "test09.c"
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
define i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !45 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !50, metadata !DIExpression()), !dbg !51
  %7 = load i32, i32* %4, align 4, !dbg !52
  %8 = load i32, i32* %5, align 4, !dbg !53
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !54
  %10 = call i32 @foo(i32 %7, i32 %8, i32 (i32, i32)* %9), !dbg !55
  ret i32 %10, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !57 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !72
  %11 = load i8, i8* %4, align 1, !dbg !73
  %12 = sext i8 %11 to i32, !dbg !73
  %13 = icmp eq i32 %12, 43, !dbg !75
  br i1 %13, label %14, label %16, !dbg !76

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !77
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !79
  br label %23, !dbg !80

16:                                               ; preds = %3
  %17 = load i8, i8* %4, align 1, !dbg !81
  %18 = sext i8 %17 to i32, !dbg !81
  %19 = icmp eq i32 %18, 45, !dbg !83
  br i1 %19, label %20, label %22, !dbg !84

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !85
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !87
  br label %22, !dbg !88

22:                                               ; preds = %20, %16
  br label %23

23:                                               ; preds = %22, %14
  call void @llvm.dbg.declare(metadata i32* %10, metadata !89, metadata !DIExpression()), !dbg !91
  %24 = load i32, i32* %5, align 4, !dbg !92
  %25 = load i32, i32* %6, align 4, !dbg !93
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !94
  %27 = call i32 @clever(i32 %24, i32 %25, i32 (i32, i32)* %26), !dbg !95
  store i32 %27, i32* %10, align 4, !dbg !91
  ret i32 0, !dbg !96
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test09.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
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
!33 = !{!13, !13, !13, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 9, type: !13)
!36 = !DILocation(line: 9, column: 13, scope: !31)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 9, type: !13)
!38 = !DILocation(line: 9, column: 20, scope: !31)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 9, type: !34)
!40 = !DILocation(line: 9, column: 29, scope: !31)
!41 = !DILocation(line: 10, column: 11, scope: !31)
!42 = !DILocation(line: 10, column: 18, scope: !31)
!43 = !DILocation(line: 10, column: 21, scope: !31)
!44 = !DILocation(line: 10, column: 4, scope: !31)
!45 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !32, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "a", arg: 1, scope: !45, file: !1, line: 13, type: !13)
!47 = !DILocation(line: 13, column: 16, scope: !45)
!48 = !DILocalVariable(name: "b", arg: 2, scope: !45, file: !1, line: 13, type: !13)
!49 = !DILocation(line: 13, column: 23, scope: !45)
!50 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !45, file: !1, line: 13, type: !34)
!51 = !DILocation(line: 13, column: 32, scope: !45)
!52 = !DILocation(line: 14, column: 16, scope: !45)
!53 = !DILocation(line: 14, column: 19, scope: !45)
!54 = !DILocation(line: 14, column: 22, scope: !45)
!55 = !DILocation(line: 14, column: 12, scope: !45)
!56 = !DILocation(line: 14, column: 5, scope: !45)
!57 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 18, type: !58, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!13, !60, !13, !13}
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "x", arg: 1, scope: !57, file: !1, line: 18, type: !60)
!62 = !DILocation(line: 18, column: 14, scope: !57)
!63 = !DILocalVariable(name: "op1", arg: 2, scope: !57, file: !1, line: 18, type: !13)
!64 = !DILocation(line: 18, column: 21, scope: !57)
!65 = !DILocalVariable(name: "op2", arg: 3, scope: !57, file: !1, line: 18, type: !13)
!66 = !DILocation(line: 18, column: 30, scope: !57)
!67 = !DILocalVariable(name: "a_fptr", scope: !57, file: !1, line: 19, type: !34)
!68 = !DILocation(line: 19, column: 11, scope: !57)
!69 = !DILocalVariable(name: "s_fptr", scope: !57, file: !1, line: 20, type: !34)
!70 = !DILocation(line: 20, column: 11, scope: !57)
!71 = !DILocalVariable(name: "t_fptr", scope: !57, file: !1, line: 21, type: !34)
!72 = !DILocation(line: 21, column: 11, scope: !57)
!73 = !DILocation(line: 23, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !57, file: !1, line: 23, column: 9)
!75 = !DILocation(line: 23, column: 11, scope: !74)
!76 = !DILocation(line: 23, column: 9, scope: !57)
!77 = !DILocation(line: 24, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 23, column: 19)
!79 = !DILocation(line: 24, column: 15, scope: !78)
!80 = !DILocation(line: 25, column: 5, scope: !78)
!81 = !DILocation(line: 26, column: 14, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !1, line: 26, column: 14)
!83 = !DILocation(line: 26, column: 16, scope: !82)
!84 = !DILocation(line: 26, column: 14, scope: !74)
!85 = !DILocation(line: 27, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 26, column: 24)
!87 = !DILocation(line: 27, column: 15, scope: !86)
!88 = !DILocation(line: 28, column: 5, scope: !86)
!89 = !DILocalVariable(name: "result", scope: !57, file: !1, line: 30, type: !90)
!90 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!91 = !DILocation(line: 30, column: 14, scope: !57)
!92 = !DILocation(line: 30, column: 30, scope: !57)
!93 = !DILocation(line: 30, column: 35, scope: !57)
!94 = !DILocation(line: 30, column: 40, scope: !57)
!95 = !DILocation(line: 30, column: 23, scope: !57)
!96 = !DILocation(line: 31, column: 5, scope: !57)
