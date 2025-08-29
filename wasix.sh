#! /bin/bash

set -exuo pipefail

export \
  CC=wasixcc \
  CXX=wasix++ \
  AR=wasixar \
  NM=wasixnm \
  RANLIB=wasixranlib \
  WASIXCC_WASM_EXCEPTIONS=yes \
  WASIXCC_PIC=yes \
  WASIXCC_COMPILER_FLAGS="-D__wasix__"

./configure \
  --host=wasm32-wasmer-wasi \
  --enable-static --disable-shared \
  --disable-dependency-tracking --disable-builddir --disable-multi-os-directory \
  --disable-raw-api --disable-docs \
  --prefix=$(realpath ./dist)

make clean
make
make install