; ModuleID = 'test04.bc'
source_filename = "test04.c"
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
define i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !33 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !41, metadata !DIExpression()), !dbg !42
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !43
  %8 = load i32, i32* %4, align 4, !dbg !44
  %9 = load i32, i32* %5, align 4, !dbg !45
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !43
  ret i32 %10, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever(i32 %0) #0 !dbg !47 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca i32 (i32, i32)*, align 8
  %6 = alloca i32 (i32, i32)*, align 8
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %5, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 (i32, i32)* null, i32 (i32, i32)** %5, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 (i32, i32)* null, i32 (i32, i32)** %6, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 (i32, i32)* null, i32 (i32, i32)** %7, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %8, metadata !62, metadata !DIExpression()), !dbg !64
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %8, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %9, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 1, i32* %9, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata i32* %10, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 2, i32* %10, align 4, !dbg !68
  %12 = load i32, i32* %2, align 4, !dbg !69
  %13 = icmp sge i32 %12, 4, !dbg !71
  br i1 %13, label %14, label %16, !dbg !72

14:                                               ; preds = %1
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !73
  store i32 (i32, i32)* %15, i32 (i32, i32)** %5, align 8, !dbg !75
  br label %16, !dbg !76

16:                                               ; preds = %14, %1
  %17 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %8, align 8, !dbg !77
  %18 = load i32, i32* %9, align 4, !dbg !78
  %19 = load i32, i32* %10, align 4, !dbg !79
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !80
  %21 = call i32 %17(i32 %18, i32 %19, i32 (i32, i32)* %20), !dbg !77
  %22 = load i32, i32* %2, align 4, !dbg !81
  %23 = icmp sge i32 %22, 5, !dbg !83
  br i1 %23, label %24, label %27, !dbg !84

24:                                               ; preds = %16
  %25 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !85
  store i32 (i32, i32)* %25, i32 (i32, i32)** %5, align 8, !dbg !87
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !88
  store i32 (i32, i32)* %26, i32 (i32, i32)** %6, align 8, !dbg !89
  br label %27, !dbg !90

27:                                               ; preds = %24, %16
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !91
  %29 = icmp ne i32 (i32, i32)* %28, null, !dbg !93
  br i1 %29, label %30, label %36, !dbg !94

30:                                               ; preds = %27
  call void @llvm.dbg.declare(metadata i32* %11, metadata !95, metadata !DIExpression()), !dbg !98
  %31 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %8, align 8, !dbg !99
  %32 = load i32, i32* %9, align 4, !dbg !100
  %33 = load i32, i32* %10, align 4, !dbg !101
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !102
  %35 = call i32 %31(i32 %32, i32 %33, i32 (i32, i32)* %34), !dbg !99
  store i32 %35, i32* %11, align 4, !dbg !98
  br label %36, !dbg !103

36:                                               ; preds = %30, %27
  ret i32 0, !dbg !104
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test04.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
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
!33 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !34, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!15, !15, !15, !36}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!37 = !DILocalVariable(name: "a", arg: 1, scope: !33, file: !1, line: 9, type: !15)
!38 = !DILocation(line: 9, column: 13, scope: !33)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !33, file: !1, line: 9, type: !15)
!40 = !DILocation(line: 9, column: 20, scope: !33)
!41 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !33, file: !1, line: 9, type: !36)
!42 = !DILocation(line: 9, column: 29, scope: !33)
!43 = !DILocation(line: 10, column: 12, scope: !33)
!44 = !DILocation(line: 10, column: 19, scope: !33)
!45 = !DILocation(line: 10, column: 22, scope: !33)
!46 = !DILocation(line: 10, column: 5, scope: !33)
!47 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !48, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!15, !15}
!50 = !DILocalVariable(name: "x", arg: 1, scope: !47, file: !1, line: 13, type: !15)
!51 = !DILocation(line: 13, column: 16, scope: !47)
!52 = !DILocalVariable(name: "a_fptr", scope: !47, file: !1, line: 14, type: !36)
!53 = !DILocation(line: 14, column: 11, scope: !47)
!54 = !DILocalVariable(name: "s_fptr", scope: !47, file: !1, line: 15, type: !36)
!55 = !DILocation(line: 15, column: 11, scope: !47)
!56 = !DILocalVariable(name: "t_fptr", scope: !47, file: !1, line: 16, type: !36)
!57 = !DILocation(line: 16, column: 11, scope: !47)
!58 = !DILocalVariable(name: "q_fptr", scope: !47, file: !1, line: 17, type: !36)
!59 = !DILocation(line: 17, column: 11, scope: !47)
!60 = !DILocalVariable(name: "r_fptr", scope: !47, file: !1, line: 18, type: !36)
!61 = !DILocation(line: 18, column: 11, scope: !47)
!62 = !DILocalVariable(name: "af_ptr", scope: !47, file: !1, line: 19, type: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!64 = !DILocation(line: 19, column: 11, scope: !47)
!65 = !DILocalVariable(name: "op1", scope: !47, file: !1, line: 21, type: !15)
!66 = !DILocation(line: 21, column: 9, scope: !47)
!67 = !DILocalVariable(name: "op2", scope: !47, file: !1, line: 21, type: !15)
!68 = !DILocation(line: 21, column: 16, scope: !47)
!69 = !DILocation(line: 23, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !47, file: !1, line: 23, column: 9)
!71 = !DILocation(line: 23, column: 11, scope: !70)
!72 = !DILocation(line: 23, column: 9, scope: !47)
!73 = !DILocation(line: 24, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 23, column: 17)
!75 = !DILocation(line: 24, column: 15, scope: !74)
!76 = !DILocation(line: 25, column: 5, scope: !74)
!77 = !DILocation(line: 26, column: 5, scope: !47)
!78 = !DILocation(line: 26, column: 12, scope: !47)
!79 = !DILocation(line: 26, column: 16, scope: !47)
!80 = !DILocation(line: 26, column: 20, scope: !47)
!81 = !DILocation(line: 27, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !47, file: !1, line: 27, column: 9)
!83 = !DILocation(line: 27, column: 11, scope: !82)
!84 = !DILocation(line: 27, column: 9, scope: !47)
!85 = !DILocation(line: 28, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 27, column: 17)
!87 = !DILocation(line: 28, column: 15, scope: !86)
!88 = !DILocation(line: 29, column: 17, scope: !86)
!89 = !DILocation(line: 29, column: 15, scope: !86)
!90 = !DILocation(line: 30, column: 5, scope: !86)
!91 = !DILocation(line: 32, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !47, file: !1, line: 32, column: 9)
!93 = !DILocation(line: 32, column: 16, scope: !92)
!94 = !DILocation(line: 32, column: 9, scope: !47)
!95 = !DILocalVariable(name: "result", scope: !96, file: !1, line: 33, type: !97)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 32, column: 25)
!97 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!98 = !DILocation(line: 33, column: 17, scope: !96)
!99 = !DILocation(line: 33, column: 26, scope: !96)
!100 = !DILocation(line: 33, column: 33, scope: !96)
!101 = !DILocation(line: 33, column: 37, scope: !96)
!102 = !DILocation(line: 33, column: 41, scope: !96)
!103 = !DILocation(line: 34, column: 5, scope: !96)
!104 = !DILocation(line: 35, column: 4, scope: !47)
