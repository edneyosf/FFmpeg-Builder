FROM debian:trixie-slim

ARG VERSION
ARG DIR
ARG SOURCES_DIR
ARG BUILD_DIR
ARG LIBS_DIR

ENV DEBIAN_FRONTEND=noninteractive

ENV VERSION=${VERSION}
ENV DIR=${DIR}
ENV SOURCES_DIR=${SOURCES_DIR}
ENV BUILD_DIR=${BUILD_DIR}
ENV LIBS_DIR=${LIBS_DIR}

RUN apt update -qq
RUN apt -y install \
    build-essential \
    git \
    autoconf \
    automake \
    libtool \
    cmake \
    meson \
    ninja-build \
    pkg-config \
    yasm \
    wget \
    nasm \
    doxygen \
    zlib1g-dev \
    libfreetype6-dev \
    libass-dev \
    libdav1d-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p $SOURCES_DIR $BUILD_DIR $LIBS_DIR

COPY generate.sh $DIR/generate.sh
RUN chmod +x $DIR/generate.sh

COPY libs/ $LIBS_DIR
RUN chmod -R +x $LIBS_DIR

