#!/usr/bin/env bash
mkdir -p build
pushd build
conan install .. includeos/latest -pr clang-6.0-linux-x86_64
source activate.sh
cmake ..
make -j
#popd
