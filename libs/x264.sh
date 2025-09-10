#!/bin/bash

REPOSITORY="https://code.videolan.org/videolan/x264.git"
BRANCH="stable"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd x264
./configure --prefix=$BUILD_DIR --disable-cli --enable-static --enable-pic --disable-lavf --disable-swscale
make -j $(nproc)
make install