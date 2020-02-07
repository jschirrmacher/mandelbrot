#/bin/bash

CWD=$(dirname "$0")

go build -o $CWD/mandelbrot $CWD/mandelbrot.go
