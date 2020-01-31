#/bin/bash

CWD=$(dirname "$0")

cc $CWD/mandelbrot.c -o $CWD/mandelbrot
