#!/bin/bash
source @includes.sh
echo '###################################################'
echo '# Description: Normalizes an audio file to wav'
echo '# Usage: $ ./wavNormalizeTo16-44.sh /path/to/audio.aif'
echo '# Param 1: Audio file'
echo '# Requires: ffmpeg'
echo '###################################################'
echoNewline

################################################################################
################################################################################
# check parameters

if [[ $1 == "" ]] ; then
    echoError "1st arg must be an audio file"
    exit 1
fi

################################################################################
################################################################################
# do conversion

filename=$1
extension=$(extension $filename)
outputFile="$filename.normalized.wav"
ffmpeg -i $filename -af aformat=s16:44100 "$outputFile"

################################################################################
################################################################################
# complete

echoSuccess "Normalized audio to 16/44.1 wav: $outputFile"
