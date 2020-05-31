#!/bin/sh -l

echo "Hello $1, we gonna list your files..."
echo "$(ls -1 | tr '\n' ' ')"