#!/bin/bash

VERSION=$(gcc -dumpversion)
dotnet run -p Mandalbrot.csproj | sed -e "s/C/C gcc ${VERSION}/"
