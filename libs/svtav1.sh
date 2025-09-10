#!/bin/bash

REPOSITORY="https://gitlab.com/AOMediaCodec/SVT-AV1.git"
BRANCH="v3.1.2"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd SVT-AV1
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$BUILD_DIR -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF -DBUILD_APPS=OFF -DENABLE_AVX512=ON ..
make -j $(nproc)
make install