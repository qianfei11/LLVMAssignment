; ModuleID = 'test17.bc'
source_filename = "test17.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %1, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %2, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %2, align 4, !dbg !18
  br label %3, !dbg !19

3:                                                ; preds = %19, %0
  %4 = load i32, i32* %2, align 4, !dbg !20
  %5 = icmp slt i32 %4, 10, !dbg !22
  br i1 %5, label %6, label %22, !dbg !23

6:                                                ; preds = %3
  %7 = load i32, i32* %2, align 4, !dbg !24
  %8 = srem i32 %7, 2, !dbg !27
  %9 = icmp ne i32 %8, 0, !dbg !27
  br i1 %9, label %10, label %14, !dbg !28

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !29
  %12 = load i32, i32* %2, align 4, !dbg !30
  %13 = call i32 @plus(i32 %11, i32 %12), !dbg !31
  store i32 %13, i32* %1, align 4, !dbg !32
  br label %18, !dbg !33

14:                                               ; preds = %6
  %15 = load i32, i32* %1, align 4, !dbg !34
  %16 = load i32, i32* %2, align 4, !dbg !35
  %17 = call i32 @minus(i32 %15, i32 %16), !dbg !36
  store i32 %17, i32* %1, align 4, !dbg !37
  br label %18

18:                                               ; preds = %14, %10
  br label %19, !dbg !38

19:                                               ; preds = %18
  %20 = load i32, i32* %2, align 4, !dbg !39
  %21 = add nsw i32 %20, 1, !dbg !39
  store i32 %21, i32* %2, align 4, !dbg !39
  br label %3, !dbg !40, !llvm.loop !41

22:                                               ; preds = %3
  %23 = load i32, i32* %1, align 4, !dbg !44
  ret i32 %23, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !46 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !51, metadata !DIExpression()), !dbg !52
  %5 = load i32, i32* %3, align 4, !dbg !53
  %6 = load i32, i32* %4, align 4, !dbg !54
  %7 = add nsw i32 %5, %6, !dbg !55
  ret i32 %7, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @minus(i32 %0, i32 %1) #0 !dbg !57 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !60, metadata !DIExpression()), !dbg !61
  %5 = load i32, i32* %3, align 4, !dbg !62
  %6 = load i32, i32* %4, align 4, !dbg !63
  %7 = sub nsw i32 %5, %6, !dbg !64
  ret i32 %7, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo(i32 ()* %0) #0 !dbg !66 {
  %2 = alloca i32 ()*, align 8
  store i32 ()* %0, i32 ()** %2, align 8
  call void @llvm.dbg.declare(metadata i32 ()** %2, metadata !70, metadata !DIExpression()), !dbg !71
  %3 = load i32 ()*, i32 ()** %2, align 8, !dbg !72
  %4 = call i32 %3(), !dbg !72
  ret i32 %4, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @moo(i32 (i32 ()*)* %0, i32 ()* %1) #0 !dbg !74 {
  %3 = alloca i32 (i32 ()*)*, align 8
  %4 = alloca i32 ()*, align 8
  store i32 (i32 ()*)* %0, i32 (i32 ()*)** %3, align 8
  call void @llvm.dbg.declare(metadata i32 (i32 ()*)** %3, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 ()* %1, i32 ()** %4, align 8
  call void @llvm.dbg.declare(metadata i32 ()** %4, metadata !80, metadata !DIExpression()), !dbg !81
  %5 = load i32 (i32 ()*)*, i32 (i32 ()*)** %3, align 8, !dbg !82
  %6 = load i32 ()*, i32 ()** %4, align 8, !dbg !83
  %7 = call i32 %5(i32 ()* %6), !dbg !82
  ret i32 %7, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @use() #0 !dbg !85 {
  %1 = alloca i32 (i32 (i32 ()*)*, i32 ()*)*, align 8
  call void @llvm.dbg.declare(metadata i32 (i32 (i32 ()*)*, i32 ()*)** %1, metadata !86, metadata !DIExpression()), !dbg !88
  store i32 (i32 (i32 ()*)*, i32 ()*)* @moo, i32 (i32 (i32 ()*)*, i32 ()*)** %1, align 8, !dbg !89
  %2 = load i32 (i32 (i32 ()*)*, i32 ()*)*, i32 (i32 (i32 ()*)*, i32 ()*)** %1, align 8, !dbg !90
  %3 = call i32 %2(i32 (i32 ()*)* @foo, i32 ()* @clever), !dbg !90
  ret i32 %3, !dbg !91
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test17.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Homebrew clang version 13.0.0"}
!10 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 6, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 9, scope: !10)
!16 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 9, type: !13)
!17 = distinct !DILexicalBlock(scope: !10, file: !1, line: 9, column: 5)
!18 = !DILocation(line: 9, column: 13, scope: !17)
!19 = !DILocation(line: 9, column: 9, scope: !17)
!20 = !DILocation(line: 9, column: 17, scope: !21)
!21 = distinct !DILexicalBlock(scope: !17, file: !1, line: 9, column: 5)
!22 = !DILocation(line: 9, column: 18, scope: !21)
!23 = !DILocation(line: 9, column: 5, scope: !17)
!24 = !DILocation(line: 11, column: 12, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 11, column: 12)
!26 = distinct !DILexicalBlock(scope: !21, file: !1, line: 10, column: 5)
!27 = !DILocation(line: 11, column: 13, scope: !25)
!28 = !DILocation(line: 11, column: 12, scope: !26)
!29 = !DILocation(line: 12, column: 20, scope: !25)
!30 = !DILocation(line: 12, column: 22, scope: !25)
!31 = !DILocation(line: 12, column: 15, scope: !25)
!32 = !DILocation(line: 12, column: 14, scope: !25)
!33 = !DILocation(line: 12, column: 13, scope: !25)
!34 = !DILocation(line: 14, column: 21, scope: !25)
!35 = !DILocation(line: 14, column: 23, scope: !25)
!36 = !DILocation(line: 14, column: 15, scope: !25)
!37 = !DILocation(line: 14, column: 14, scope: !25)
!38 = !DILocation(line: 15, column: 5, scope: !26)
!39 = !DILocation(line: 9, column: 23, scope: !21)
!40 = !DILocation(line: 9, column: 5, scope: !21)
!41 = distinct !{!41, !23, !42, !43}
!42 = !DILocation(line: 15, column: 5, scope: !17)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 16, column: 12, scope: !10)
!45 = !DILocation(line: 16, column: 5, scope: !10)
!46 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 37, type: !47, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!13, !13, !13}
!49 = !DILocalVariable(name: "a", arg: 1, scope: !46, file: !1, line: 37, type: !13)
!50 = !DILocation(line: 37, column: 14, scope: !46)
!51 = !DILocalVariable(name: "b", arg: 2, scope: !46, file: !1, line: 37, type: !13)
!52 = !DILocation(line: 37, column: 21, scope: !46)
!53 = !DILocation(line: 39, column: 12, scope: !46)
!54 = !DILocation(line: 39, column: 14, scope: !46)
!55 = !DILocation(line: 39, column: 13, scope: !46)
!56 = !DILocation(line: 39, column: 5, scope: !46)
!57 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 33, type: !47, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "a", arg: 1, scope: !57, file: !1, line: 33, type: !13)
!59 = !DILocation(line: 33, column: 15, scope: !57)
!60 = !DILocalVariable(name: "b", arg: 2, scope: !57, file: !1, line: 33, type: !13)
!61 = !DILocation(line: 33, column: 21, scope: !57)
!62 = !DILocation(line: 35, column: 12, scope: !57)
!63 = !DILocation(line: 35, column: 14, scope: !57)
!64 = !DILocation(line: 35, column: 13, scope: !57)
!65 = !DILocation(line: 35, column: 5, scope: !57)
!66 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 18, type: !67, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!13, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!70 = !DILocalVariable(name: "pf_ptr", arg: 1, scope: !66, file: !1, line: 18, type: !69)
!71 = !DILocation(line: 18, column: 14, scope: !66)
!72 = !DILocation(line: 20, column: 12, scope: !66)
!73 = !DILocation(line: 20, column: 5, scope: !66)
!74 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 23, type: !75, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!13, !77, !69}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!78 = !DILocalVariable(name: "uf_ptr", arg: 1, scope: !74, file: !1, line: 23, type: !77)
!79 = !DILocation(line: 23, column: 15, scope: !74)
!80 = !DILocalVariable(name: "pf_ptr", arg: 2, scope: !74, file: !1, line: 23, type: !69)
!81 = !DILocation(line: 23, column: 42, scope: !74)
!82 = !DILocation(line: 25, column: 12, scope: !74)
!83 = !DILocation(line: 25, column: 19, scope: !74)
!84 = !DILocation(line: 25, column: 5, scope: !74)
!85 = distinct !DISubprogram(name: "use", scope: !1, file: !1, line: 27, type: !11, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "uf_ptr", scope: !85, file: !1, line: 29, type: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!88 = !DILocation(line: 29, column: 8, scope: !85)
!89 = !DILocation(line: 30, column: 8, scope: !85)
!90 = !DILocation(line: 31, column: 9, scope: !85)
!91 = !DILocation(line: 31, column: 2, scope: !85)
