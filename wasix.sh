#! /bin/bash

set -exuo pipefail

if [ -z "$WASIXCC_SYSROOT" ]; then
  export WASIXCC_SYSROOT=$WASIX_SYSROOT
fi

export \
  CC=wasixcc \
  CXX=wasix++ \
  AR=wasixar \
  NM=wasixnm \
  RANLIB=wasixranlib \
  WASIXCC_WASM_EXCEPTIONS=yes \
  WASIXCC_PIC=yes

./configure \
  --host=wasm32-wasmer-wasi \
  --enable-static --disable-shared \
  --disable-dependency-tracking --disable-builddir --disable-multi-os-directory \
  --disable-raw-api --disable-docs

make clean

make -j16