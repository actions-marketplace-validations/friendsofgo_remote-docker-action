#!/bin/sh -l

echo "Hello $1, we gonna list your files..."
files=$(ls)
echo "::set-output name=time::$files"