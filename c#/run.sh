#!/bin/bash

VERSION=$(dotnet --version)
cd $(dirname "$0")
dotnet run -p Mandelbrot.csproj | sed -e "s/C#/C# ${VERSION}/"
cd ..
