#!/bin/bash

VERSION=$(deno --version | head -n 1 | cut -d " " -f 2)
deno run $(dirname "$0")/mandelbrot.ts | sed -e "s/Deno /Deno ${VERSION} /"
