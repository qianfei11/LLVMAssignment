; ModuleID = 'test05.bc'
source_filename = "test05.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !12 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !18, metadata !DIExpression()), !dbg !19
  %5 = load i32, i32* %3, align 4, !dbg !20
  %6 = load i32, i32* %4, align 4, !dbg !21
  %7 = add nsw i32 %5, %6, !dbg !22
  ret i32 %7, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @minus(i32 %0, i32 %1) #0 !dbg !24 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !27, metadata !DIExpression()), !dbg !28
  %5 = load i32, i32* %3, align 4, !dbg !29
  %6 = load i32, i32* %4, align 4, !dbg !30
  %7 = sub nsw i32 %5, %6, !dbg !31
  ret i32 %7, !dbg !32
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever(i32 %0) #0 !dbg !33 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca i32 (i32, i32)*, align 8
  %6 = alloca i32 (i32, i32)*, align 8
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !38, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %5, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 (i32, i32)* null, i32 (i32, i32)** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 (i32, i32)* null, i32 (i32, i32)** %6, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 (i32, i32)* null, i32 (i32, i32)** %7, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %8, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 1, i32* %8, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %9, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 2, i32* %9, align 4, !dbg !52
  %11 = load i32, i32* %2, align 4, !dbg !53
  %12 = icmp sge i32 %11, 3, !dbg !55
  br i1 %12, label %13, label %15, !dbg !56

13:                                               ; preds = %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !57
  store i32 (i32, i32)* %14, i32 (i32, i32)** %5, align 8, !dbg !59
  br label %15, !dbg !60

15:                                               ; preds = %13, %1
  %16 = load i32, i32* %2, align 4, !dbg !61
  %17 = icmp sge i32 %16, 4, !dbg !63
  br i1 %17, label %18, label %20, !dbg !64

18:                                               ; preds = %15
  %19 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !65
  store i32 (i32, i32)* %19, i32 (i32, i32)** %5, align 8, !dbg !67
  br label %20, !dbg !68

20:                                               ; preds = %18, %15
  %21 = load i32, i32* %2, align 4, !dbg !69
  %22 = icmp sge i32 %21, 5, !dbg !71
  br i1 %22, label %23, label %25, !dbg !72

23:                                               ; preds = %20
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !73
  store i32 (i32, i32)* %24, i32 (i32, i32)** %6, align 8, !dbg !75
  br label %25, !dbg !76

25:                                               ; preds = %23, %20
  %26 = load i32, i32* %2, align 4, !dbg !77
  %27 = icmp sge i32 %26, 6, !dbg !79
  br i1 %27, label %28, label %30, !dbg !80

28:                                               ; preds = %25
  %29 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !81
  store i32 (i32, i32)* %29, i32 (i32, i32)** %7, align 8, !dbg !82
  br label %30, !dbg !83

30:                                               ; preds = %28, %25
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !84
  %32 = icmp ne i32 (i32, i32)* %31, null, !dbg !86
  br i1 %32, label %33, label %38, !dbg !87

33:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata i32* %10, metadata !88, metadata !DIExpression()), !dbg !91
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !92
  %35 = load i32, i32* %8, align 4, !dbg !93
  %36 = load i32, i32* %9, align 4, !dbg !94
  %37 = call i32 %34(i32 %35, i32 %36), !dbg !92
  store i32 %37, i32* %10, align 4, !dbg !91
  br label %38, !dbg !95

38:                                               ; preds = %33, %30
  ret i32 0, !dbg !96
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test05.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !13, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "a", arg: 1, scope: !12, file: !1, line: 2, type: !15)
!17 = !DILocation(line: 2, column: 14, scope: !12)
!18 = !DILocalVariable(name: "b", arg: 2, scope: !12, file: !1, line: 2, type: !15)
!19 = !DILocation(line: 2, column: 21, scope: !12)
!20 = !DILocation(line: 3, column: 11, scope: !12)
!21 = !DILocation(line: 3, column: 13, scope: !12)
!22 = !DILocation(line: 3, column: 12, scope: !12)
!23 = !DILocation(line: 3, column: 4, scope: !12)
!24 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !13, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !1, line: 6, type: !15)
!26 = !DILocation(line: 6, column: 15, scope: !24)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 6, type: !15)
!28 = !DILocation(line: 6, column: 22, scope: !24)
!29 = !DILocation(line: 7, column: 11, scope: !24)
!30 = !DILocation(line: 7, column: 13, scope: !24)
!31 = !DILocation(line: 7, column: 12, scope: !24)
!32 = !DILocation(line: 7, column: 4, scope: !24)
!33 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !34, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!15, !15}
!36 = !DILocalVariable(name: "x", arg: 1, scope: !33, file: !1, line: 10, type: !15)
!37 = !DILocation(line: 10, column: 16, scope: !33)
!38 = !DILocalVariable(name: "a_fptr", scope: !33, file: !1, line: 11, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!40 = !DILocation(line: 11, column: 11, scope: !33)
!41 = !DILocalVariable(name: "s_fptr", scope: !33, file: !1, line: 12, type: !39)
!42 = !DILocation(line: 12, column: 11, scope: !33)
!43 = !DILocalVariable(name: "t_fptr", scope: !33, file: !1, line: 13, type: !39)
!44 = !DILocation(line: 13, column: 11, scope: !33)
!45 = !DILocalVariable(name: "q_fptr", scope: !33, file: !1, line: 14, type: !39)
!46 = !DILocation(line: 14, column: 11, scope: !33)
!47 = !DILocalVariable(name: "r_fptr", scope: !33, file: !1, line: 15, type: !39)
!48 = !DILocation(line: 15, column: 11, scope: !33)
!49 = !DILocalVariable(name: "op1", scope: !33, file: !1, line: 17, type: !15)
!50 = !DILocation(line: 17, column: 9, scope: !33)
!51 = !DILocalVariable(name: "op2", scope: !33, file: !1, line: 17, type: !15)
!52 = !DILocation(line: 17, column: 16, scope: !33)
!53 = !DILocation(line: 19, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !33, file: !1, line: 19, column: 9)
!55 = !DILocation(line: 19, column: 11, scope: !54)
!56 = !DILocation(line: 19, column: 9, scope: !33)
!57 = !DILocation(line: 20, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 19, column: 17)
!59 = !DILocation(line: 20, column: 15, scope: !58)
!60 = !DILocation(line: 21, column: 5, scope: !58)
!61 = !DILocation(line: 22, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !33, file: !1, line: 22, column: 9)
!63 = !DILocation(line: 22, column: 11, scope: !62)
!64 = !DILocation(line: 22, column: 9, scope: !33)
!65 = !DILocation(line: 23, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 22, column: 17)
!67 = !DILocation(line: 23, column: 15, scope: !66)
!68 = !DILocation(line: 24, column: 5, scope: !66)
!69 = !DILocation(line: 25, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !33, file: !1, line: 25, column: 9)
!71 = !DILocation(line: 25, column: 11, scope: !70)
!72 = !DILocation(line: 25, column: 9, scope: !33)
!73 = !DILocation(line: 26, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 25, column: 17)
!75 = !DILocation(line: 26, column: 15, scope: !74)
!76 = !DILocation(line: 27, column: 5, scope: !74)
!77 = !DILocation(line: 28, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !33, file: !1, line: 28, column: 9)
!79 = !DILocation(line: 28, column: 11, scope: !78)
!80 = !DILocation(line: 28, column: 9, scope: !33)
!81 = !DILocation(line: 29, column: 17, scope: !78)
!82 = !DILocation(line: 29, column: 15, scope: !78)
!83 = !DILocation(line: 29, column: 8, scope: !78)
!84 = !DILocation(line: 32, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !33, file: !1, line: 32, column: 9)
!86 = !DILocation(line: 32, column: 16, scope: !85)
!87 = !DILocation(line: 32, column: 9, scope: !33)
!88 = !DILocalVariable(name: "result", scope: !89, file: !1, line: 33, type: !90)
!89 = distinct !DILexicalBlock(scope: !85, file: !1, line: 32, column: 25)
!90 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!91 = !DILocation(line: 33, column: 17, scope: !89)
!92 = !DILocation(line: 33, column: 26, scope: !89)
!93 = !DILocation(line: 33, column: 33, scope: !89)
!94 = !DILocation(line: 33, column: 38, scope: !89)
!95 = !DILocation(line: 34, column: 5, scope: !89)
!96 = !DILocation(line: 35, column: 4, scope: !33)
