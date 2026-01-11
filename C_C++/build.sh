#!/bin/bash

# Build script for C++ & Assembly code

#NASM
echo "Assembling NASM files....."
nasm -f elf64 test1.asm -o test_asm.o

#G++
echo "Compiling C++ files....."
g++ -c test1.cpp -O2 -o test_cpp.o

echo "Linking........"
g++ test_cpp.o test_asm.o -o program -no-pie

echo "Building complete. Run ./program to run"
