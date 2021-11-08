; ModuleID = 'test16.bc'
source_filename = "test16.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @clever() #0 !dbg !10 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %1, align 4, !dbg !15
  %2 = load i32, i32* %1, align 4, !dbg !16
  %3 = call i32 @plus(i32 %2, i32 10), !dbg !17
  %4 = call i32 @minus(i32 %3, i32 2), !dbg !18
  store i32 %4, i32* %1, align 4, !dbg !19
  %5 = load i32, i32* %1, align 4, !dbg !20
  %6 = call i32 @plus(i32 %5, i32 2), !dbg !21
  %7 = icmp ne i32 %6, 0, !dbg !21
  br i1 %7, label %8, label %11, !dbg !21

8:                                                ; preds = %0
  %9 = load i32, i32* %1, align 4, !dbg !22
  %10 = call i32 @minus(i32 6, i32 %9), !dbg !23
  br label %12, !dbg !21

11:                                               ; preds = %0
  br label %12, !dbg !21

12:                                               ; preds = %11, %8
  %13 = phi i32 [ %10, %8 ], [ 0, %11 ], !dbg !21
  store i32 %13, i32* %1, align 4, !dbg !24
  %14 = load i32, i32* %1, align 4, !dbg !25
  ret i32 %14, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @minus(i32 %0, i32 %1) #0 !dbg !27 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i32, i32* %3, align 4, !dbg !34
  %6 = load i32, i32* %4, align 4, !dbg !35
  %7 = sub nsw i32 %5, %6, !dbg !36
  ret i32 %7, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !38 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !41, metadata !DIExpression()), !dbg !42
  %5 = load i32, i32* %3, align 4, !dbg !43
  %6 = load i32, i32* %4, align 4, !dbg !44
  %7 = add nsw i32 %5, %6, !dbg !45
  ret i32 %7, !dbg !46
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test16.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
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
!16 = !DILocation(line: 9, column: 18, scope: !10)
!17 = !DILocation(line: 9, column: 13, scope: !10)
!18 = !DILocation(line: 9, column: 7, scope: !10)
!19 = !DILocation(line: 9, column: 6, scope: !10)
!20 = !DILocation(line: 10, column: 12, scope: !10)
!21 = !DILocation(line: 10, column: 7, scope: !10)
!22 = !DILocation(line: 10, column: 25, scope: !10)
!23 = !DILocation(line: 10, column: 17, scope: !10)
!24 = !DILocation(line: 10, column: 6, scope: !10)
!25 = !DILocation(line: 11, column: 12, scope: !10)
!26 = !DILocation(line: 11, column: 5, scope: !10)
!27 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !28, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!13, !13, !13}
!30 = !DILocalVariable(name: "a", arg: 1, scope: !27, file: !1, line: 14, type: !13)
!31 = !DILocation(line: 14, column: 15, scope: !27)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !27, file: !1, line: 14, type: !13)
!33 = !DILocation(line: 14, column: 21, scope: !27)
!34 = !DILocation(line: 16, column: 12, scope: !27)
!35 = !DILocation(line: 16, column: 14, scope: !27)
!36 = !DILocation(line: 16, column: 13, scope: !27)
!37 = !DILocation(line: 16, column: 5, scope: !27)
!38 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 18, type: !28, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "a", arg: 1, scope: !38, file: !1, line: 18, type: !13)
!40 = !DILocation(line: 18, column: 14, scope: !38)
!41 = !DILocalVariable(name: "b", arg: 2, scope: !38, file: !1, line: 18, type: !13)
!42 = !DILocation(line: 18, column: 21, scope: !38)
!43 = !DILocation(line: 20, column: 12, scope: !38)
!44 = !DILocation(line: 20, column: 14, scope: !38)
!45 = !DILocation(line: 20, column: 13, scope: !38)
!46 = !DILocation(line: 20, column: 5, scope: !38)
