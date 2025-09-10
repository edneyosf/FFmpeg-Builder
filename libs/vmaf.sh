#!/bin/bash

REPOSITORY="https://github.com/Netflix/vmaf.git"
BRANCH="v3.0.0"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
mkdir -p vmaf/libvmaf/build
cd vmaf/libvmaf/build
meson setup -Denable_tests=false -Denable_docs=false -Denable_avx512=true --buildtype=release -Denable_float=true -Dbuilt_in_models=true --default-library=static .. --prefix=$BUILD_DIR --bindir=$BUILD_DIR/bin --libdir=$BUILD_DIR/lib
ninja -j $(nproc)
ninja install