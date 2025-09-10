#!/bin/bash

REPOSITORY="https://chromium.googlesource.com/webm/libwebp"
BRANCH="v1.6.0"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd libwebp
./autogen.sh
./configure --prefix=$BUILD_DIR --disable-shared --enable-static --with-pic --enable-libwebpmux --disable-libwebpextras --disable-libwebpdemux --disable-sdl --disable-gl --disable-png --disable-jpeg --disable-tiff --disable-gif
make -j $(nproc)
make install