#!/bin/bash
echo '###################################################'
echo '# Description: Resize an image to a maximum dimension'
echo '# Usage: $ ./imageResizeToMaxDimension.sh /Absolute/image/file.jpg 640'
echo '# Param 1: Image file'
echo '# Param 2: Maximum width/height'
echo '# Requires: Imagemagick'
echo '###################################################'

################################################################################
################################################################################
# check parameters

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

if [[ $1 == "" ]] ; then
    echo "# ${red}[ERROR]${reset}: 1st arg must be an image file"
    echo '###################################################'
    exit 1
fi

if [[ $2 -eq 0 ]] ; then
    echo "# ${red}[ERROR]${reset}: 2nd arg must be maximum size"
    echo '###################################################'
    exit 1
fi

################################################################################
################################################################################

# resize with Imagemagick
filename=$1
extension="${filename##*.}"
convert $1 -resize $2x$2 "$1.$2.$extension"

echo '###################################################'
echo "# Success: Image resized to max dimension of: ${green}$2${reset}"
echo '###################################################'
