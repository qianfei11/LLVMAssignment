; ModuleID = 'test07.bc'
source_filename = "test07.c"
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
define i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !31 {
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
define i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !45 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %11 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %10, metadata !61, metadata !DIExpression()), !dbg !63
  store i32 (i32, i32, i32 (i32, i32)*)* @clever, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %11, metadata !64, metadata !DIExpression()), !dbg !66
  store i32 0, i32* %11, align 4, !dbg !66
  %12 = load i8, i8* %4, align 1, !dbg !67
  %13 = sext i8 %12 to i32, !dbg !67
  %14 = icmp eq i32 %13, 43, !dbg !69
  br i1 %14, label %15, label %17, !dbg !70

15:                                               ; preds = %3
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !71
  store i32 (i32, i32)* %16, i32 (i32, i32)** %9, align 8, !dbg !73
  br label %19, !dbg !74

17:                                               ; preds = %3
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !75
  store i32 (i32, i32)* %18, i32 (i32, i32)** %9, align 8, !dbg !77
  br label %19

19:                                               ; preds = %17, %15
  %20 = load i32, i32* %5, align 4, !dbg !78
  %21 = icmp sgt i32 %20, 0, !dbg !80
  br i1 %21, label %22, label %28, !dbg !81

22:                                               ; preds = %19
  %23 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !82
  %24 = load i32, i32* %5, align 4, !dbg !83
  %25 = load i32, i32* %6, align 4, !dbg !84
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !85
  %27 = call i32 %23(i32 %24, i32 %25, i32 (i32, i32)* %26), !dbg !82
  store i32 %27, i32* %11, align 4, !dbg !86
  br label %34, !dbg !87

28:                                               ; preds = %19
  %29 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !88
  %30 = load i32, i32* %5, align 4, !dbg !89
  %31 = load i32, i32* %6, align 4, !dbg !90
  %32 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !91
  %33 = call i32 %29(i32 %30, i32 %31, i32 (i32, i32)* %32), !dbg !88
  store i32 %33, i32* %11, align 4, !dbg !92
  br label %34

34:                                               ; preds = %28, %22
  %35 = load i32, i32* %11, align 4, !dbg !93
  ret i32 %35, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test07.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
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
!31 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 9, type: !32, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!13, !13, !13, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 9, type: !13)
!36 = !DILocation(line: 9, column: 16, scope: !31)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 9, type: !13)
!38 = !DILocation(line: 9, column: 23, scope: !31)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 9, type: !34)
!40 = !DILocation(line: 9, column: 32, scope: !31)
!41 = !DILocation(line: 10, column: 12, scope: !31)
!42 = !DILocation(line: 10, column: 19, scope: !31)
!43 = !DILocation(line: 10, column: 22, scope: !31)
!44 = !DILocation(line: 10, column: 5, scope: !31)
!45 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 14, type: !46, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!13, !48, !13, !13}
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "x", arg: 1, scope: !45, file: !1, line: 14, type: !48)
!50 = !DILocation(line: 14, column: 14, scope: !45)
!51 = !DILocalVariable(name: "op1", arg: 2, scope: !45, file: !1, line: 14, type: !13)
!52 = !DILocation(line: 14, column: 21, scope: !45)
!53 = !DILocalVariable(name: "op2", arg: 3, scope: !45, file: !1, line: 14, type: !13)
!54 = !DILocation(line: 14, column: 30, scope: !45)
!55 = !DILocalVariable(name: "a_fptr", scope: !45, file: !1, line: 15, type: !34)
!56 = !DILocation(line: 15, column: 11, scope: !45)
!57 = !DILocalVariable(name: "s_fptr", scope: !45, file: !1, line: 16, type: !34)
!58 = !DILocation(line: 16, column: 11, scope: !45)
!59 = !DILocalVariable(name: "t_fptr", scope: !45, file: !1, line: 17, type: !34)
!60 = !DILocation(line: 17, column: 11, scope: !45)
!61 = !DILocalVariable(name: "af_ptr", scope: !45, file: !1, line: 18, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!63 = !DILocation(line: 18, column: 11, scope: !45)
!64 = !DILocalVariable(name: "result", scope: !45, file: !1, line: 19, type: !65)
!65 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!66 = !DILocation(line: 19, column: 14, scope: !45)
!67 = !DILocation(line: 20, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !45, file: !1, line: 20, column: 9)
!69 = !DILocation(line: 20, column: 11, scope: !68)
!70 = !DILocation(line: 20, column: 9, scope: !45)
!71 = !DILocation(line: 21, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 20, column: 19)
!73 = !DILocation(line: 21, column: 15, scope: !72)
!74 = !DILocation(line: 22, column: 5, scope: !72)
!75 = !DILocation(line: 24, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !68, file: !1, line: 23, column: 5)
!77 = !DILocation(line: 24, column: 15, scope: !76)
!78 = !DILocation(line: 27, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !45, file: !1, line: 27, column: 8)
!80 = !DILocation(line: 27, column: 12, scope: !79)
!81 = !DILocation(line: 27, column: 8, scope: !45)
!82 = !DILocation(line: 28, column: 16, scope: !79)
!83 = !DILocation(line: 28, column: 23, scope: !79)
!84 = !DILocation(line: 28, column: 28, scope: !79)
!85 = !DILocation(line: 28, column: 33, scope: !79)
!86 = !DILocation(line: 28, column: 14, scope: !79)
!87 = !DILocation(line: 28, column: 8, scope: !79)
!88 = !DILocation(line: 30, column: 16, scope: !79)
!89 = !DILocation(line: 30, column: 23, scope: !79)
!90 = !DILocation(line: 30, column: 28, scope: !79)
!91 = !DILocation(line: 30, column: 33, scope: !79)
!92 = !DILocation(line: 30, column: 14, scope: !79)
!93 = !DILocation(line: 31, column: 12, scope: !45)
!94 = !DILocation(line: 31, column: 5, scope: !45)
