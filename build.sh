#!/bin/bash

VERSION="8.0"
GREEN="\e[32m"
RESET="\e[0m"
DIR="/ffmpeg"
SOURCES_DIR="$DIR/sources"
BUILD_DIR="$DIR/build"
LIBS_DIR="$DIR/libs"
ARTIFACTS_DIR=./artifacts
CONTAINER=ffmpeg-run

docker build \
    --build-arg VERSION=$VERSION \
    --build-arg DIR=$DIR \
    --build-arg SOURCES_DIR=$SOURCES_DIR \
    --build-arg BUILD_DIR=$BUILD_DIR \
    --build-arg LIBS_DIR=$LIBS_DIR \
    -t ffmpeg:$VERSION .

docker run --name $CONTAINER ffmpeg:$VERSION $DIR/generate.sh
mkdir artifacts
docker cp $CONTAINER:$BUILD_DIR/bin/ffmpeg $ARTIFACTS_DIR/
docker cp $CONTAINER:$BUILD_DIR/bin/ffprobe $ARTIFACTS_DIR/
docker rm $CONTAINER

echo -e "\n${GREEN}Finished!${RESET}\n"
sleep 2