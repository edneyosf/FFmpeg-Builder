#!/bin/bash

REPOSITORY="https://github.com/Netflix/vmaf.git"
BRANCH="v3.0.0"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd vmaf/libvmaf
meson setup build --prefix=$BUILD_DIR --bindir="$BUILD_DIR/bin" --libdir="$BUILD_DIR/lib" --buildtype=release --default-library=static -Dbuilt_in_models=true -Denable_tests=false -Denable_docs=false -Denable_avx512=true -Denable_float=true .
ninja -C build -j $(nproc) install