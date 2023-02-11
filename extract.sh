#! /bin/bash

cd app-db || exit 1
if [ ! -f "data.tar.xz" ]; then
    echo "Error: data.tar.xz not found."
    exit 1
fi
tar -xvJf data.tar.xz
