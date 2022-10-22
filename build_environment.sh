#!/bin/bash

CWD=$(dirname .)

mkdir -p $CWD/assets/fonts
mkdir -p $CWD/assets/images

# USED FONTS - Source Sans Pro

FONT_DIR="$CWD/assets/fonts/"

FONTS=()

FONTS+=("https://github.com/adobe-fonts/source-sans/raw/release/OTF/SourceSans3-Regular.otf")
FONTS+=("https://github.com/adobe-fonts/source-sans/raw/release/OTF/SourceSans3-Semibold.otf")
FONTS+=("https://github.com/adobe-fonts/source-sans/raw/release/OTF/SourceSans3-Bold.otf")


download_fonts() {
    (cd $FONT_DIR && for font in "${FONTS[@]}"; do
    printf "Downloading: $font\n"
    curl $font -O -s
    done
    ) && echo "fonts downloaded."
}

# main
download_fonts

