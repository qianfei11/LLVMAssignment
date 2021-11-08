#!/bin/bash

BC_DIR="./bc"
CUR_DIR="$PWD"
TEST_DIR="./test"

mkdir $BC_DIR
cd test
cfiles=$(ls .)
for file in $cfiles; do
    prefix=${file:0:6}
    bc_file="$prefix.bc"
    clang -emit-llvm -c -O0 -g3 $file -o $bc_file
    llvm-dis $bc_file
done
cd ..
mv test/*.bc bc
mv test/*.ll bc
