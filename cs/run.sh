#!/bin/bash

VERSION=$(dotnet --version)
cd $(dirname "$0")
LANG=en_EN.UTF-8 dotnet run -p Mandelbrot.csproj -c Release | sed -e "s/C#/C# ${VERSION}/"
cd ..
