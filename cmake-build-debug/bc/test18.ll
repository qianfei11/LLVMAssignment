; ModuleID = 'test18.bc'
source_filename = "test18.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @use() #0 !dbg !10 {
  %1 = call i32 (...) @clever(), !dbg !14
  ret i32 %1, !dbg !15
}

declare i32 @clever(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @minus(i32 %0, i32 %1) #0 !dbg !16 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !21, metadata !DIExpression()), !dbg !22
  %5 = load i32, i32* %3, align 4, !dbg !23
  %6 = load i32, i32* %4, align 4, !dbg !24
  %7 = sub nsw i32 %5, %6, !dbg !25
  ret i32 %7, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !27 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !30, metadata !DIExpression()), !dbg !31
  %5 = load i32, i32* %3, align 4, !dbg !32
  %6 = load i32, i32* %4, align 4, !dbg !33
  %7 = add nsw i32 %5, %6, !dbg !34
  ret i32 %7, !dbg !35
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX11.sdk", sdk: "MacOSX11.sdk")
!1 = !DIFile(filename: "test18.c", directory: "/Users/assassinq/CLionProjects/LLVMAssignment/cmake-build-debug/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Homebrew clang version 13.0.0"}
!10 = distinct !DISubprogram(name: "use", scope: !1, file: !1, line: 6, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocation(line: 8, column: 12, scope: !10)
!15 = !DILocation(line: 8, column: 5, scope: !10)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !17, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!13, !13, !13}
!19 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 10, type: !13)
!20 = !DILocation(line: 10, column: 15, scope: !16)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 21, scope: !16)
!23 = !DILocation(line: 12, column: 12, scope: !16)
!24 = !DILocation(line: 12, column: 14, scope: !16)
!25 = !DILocation(line: 12, column: 13, scope: !16)
!26 = !DILocation(line: 12, column: 5, scope: !16)
!27 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 14, type: !17, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !27, file: !1, line: 14, type: !13)
!29 = !DILocation(line: 14, column: 14, scope: !27)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !27, file: !1, line: 14, type: !13)
!31 = !DILocation(line: 14, column: 21, scope: !27)
!32 = !DILocation(line: 16, column: 12, scope: !27)
!33 = !DILocation(line: 16, column: 14, scope: !27)
!34 = !DILocation(line: 16, column: 13, scope: !27)
!35 = !DILocation(line: 16, column: 5, scope: !27)
