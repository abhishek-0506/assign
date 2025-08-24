#!/bin/bash
# Compile without linking the standard libraries
g++ -nostdlib -fno-exceptions -fno-rtti -o main0 main0.cpp
echo "Program1 bulit"