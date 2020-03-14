#!/bin/bash

cd $(dirname "$0")
javac -version > /tmp/java_version
VERSION=$(cat /tmp/java_version)
java Mandelbrot | sed -e "s/Java/Java ${VERSION##* }/"
