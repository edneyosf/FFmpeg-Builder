#!/bin/bash

REPOSITORY="https://aomedia.googlesource.com/aom"
BRANCH="v3.13.1"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd aom
mkdir aom_build
cd aom_build
cmake -DCMAKE_INSTALL_PREFIX=$BUILD_DIR -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DENABLE_EXAMPLES=NO -DENABLE_TESTS=NO -DENABLE_TOOLS=NO -DENABLE_NASM=on ..
make -j $(nproc)
make install