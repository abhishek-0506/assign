#!/bin/bash
nasm -f elf64 program1.S -o program.o
ld program.o -o program1
./program1
