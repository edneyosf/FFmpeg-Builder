#!/bin/bash

REPOSITORY="https://git.ffmpeg.org/ffmpeg.git"
NOW=$(date +"%d%m%Y")
BRANCH="release/$VERSION"
GREEN="\e[32m"
RESET="\e[0m"

libs=(
    "AOM:aom.sh"
    "FDK-AAC:fdk-aac.sh"
    "Opus:opus.sh"
    "SVT-AV1:svtav1.sh"
    "VMAF:vmaf.sh"
    "WebP:webp.sh"
    "x264:x264.sh"
)

for lib in "${libs[@]}"; do
    name="${lib%%:*}"
    script="${lib##*:}"

    echo -e "\n${GREEN}${name}${RESET}\n"
    bash "$LIBS_DIR/$script"
    sleep 2
done

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd ffmpeg
PKG_CONFIG_PATH="$BUILD_DIR/lib/pkgconfig" ./configure \
  --extra-version="$VERSION-$NOW" \
  --prefix=$BUILD_DIR \
  --bindir="$BUILD_DIR/bin" \
  --pkg-config-flags="--static" \
  --extra-cflags="-static-libgcc -static-libstdc++ -I$BUILD_DIR/include -O2 -pipe -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fstack-clash-protection -pthread" \
  --extra-cxxflags="-static-libgcc -static-libstdc++ -I$BUILD_DIR/include -O2 -pipe -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fstack-clash-protection -pthread" \
  --extra-ldflags="-L$BUILD_DIR/lib -Wl,-z,relro,-z,now -static-libgcc -static-libstdc++ -pthread" \
  --extra-libs="-lm -lpthread -lz" \
  --ld="g++" \
  --enable-gpl \
  --enable-nonfree \
  --enable-version3 \
  --enable-libvmaf \
  --enable-libfdk-aac \
  --enable-libopus \
  --enable-libx264 \
  --enable-libsvtav1 \
  --enable-libaom \
  --enable-libdav1d \
  --enable-libwebp \
  --enable-libfreetype \
  --enable-libass \
  --enable-libzimg \
  --enable-vaapi \
  --enable-static \
  --disable-shared \
  --disable-doc
make -j$(nproc)
make install