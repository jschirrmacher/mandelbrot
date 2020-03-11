#!/bin/bash

VERSION=$(dotnet --version)
dotnet run -p Mandalbrot.csproj | sed -e "s/C#/C# ${VERSION}/"
