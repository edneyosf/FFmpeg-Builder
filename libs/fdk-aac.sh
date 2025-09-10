#!/bin/bash

REPOSITORY="https://github.com/mstorsjo/fdk-aac.git"
BRANCH="v2.0.3"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd fdk-aac
autoreconf -fiv
./configure --prefix=$BUILD_DIR --disable-shared --enable-static --with-pic --disable-example
make -j $(nproc)
make install