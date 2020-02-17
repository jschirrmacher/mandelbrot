#!/bin/bash

VERSION=$(gcc -dumpversion)
$(dirname "$0")/mandelbrot | sed -e "s/C/C gcc ${VERSION}/"
