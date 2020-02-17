#/bin/bash

CWD=$(dirname "$0")

gcc $CWD/mandelbrot.c -O2 -o $CWD/mandelbrot
