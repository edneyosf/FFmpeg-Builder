#!/bin/bash

REPOSITORY="https://github.com/xiph/opus.git"
BRANCH="v1.5.2"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd opus
./autogen.sh
./configure --prefix=$BUILD_DIR --disable-shared --enable-static --disable-extra-programs
make -j $(nproc)
make install