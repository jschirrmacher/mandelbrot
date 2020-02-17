#!/bin/bash

cd $(dirname "$0")
javac -version 2> /tmp/java_version
VERSION=$(cat /tmp/java_version)
java Mandelbrot | sed -e "s/Java/Java ${VERSION##* }/"
