#!/usr/bin/env bash
mkdir -p build
pushd build
CC=clang-6.0
CXX=clang++-6.0
conan install .. includeos/latest -pr clang-6.0-linux-x86_64
cmake ..
make -j
popd
