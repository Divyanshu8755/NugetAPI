#!/bin/bash

set -e

PackageName="newtonsoft.json"
PackageVersion="13.0.3"
CacheDir=".nuget-cache"

LowerPackageName=$(echo "$PackageName" | tr '[:upper:]' '[:lower:]')

PackageFile="${CacheDir}/${LowerPackageName}.${PackageVersion}.nupkg"
NugetURL="https://api.nuget.org/v3-flatcontainer/${LowerPackageName}/${PackageVersion}/${LowerPackageName}.${PackageVersion}.nupkg"

mkdir -p "$CacheDir"

if [ ! -f "$PackageFile" ]; then
        echo "donwloading ${PackageName} ${PackageVersion} via Nuger API...."
        echo "URL: $NugetURL"
        curl -L "$NugetURL" -o "$PackageFile"

else
        echo "Package already exists. skipping download."
fi
