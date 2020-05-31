#!/bin/sh -l

echo "Hello $1, we gonna list your files..."
files=$(ls -1 | tr '\n' ' ')
echo "::set-output name=time::$files"