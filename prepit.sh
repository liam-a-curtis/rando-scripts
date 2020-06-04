#!/bin/bash

#rando script for prepping image files. requires exiftools. use at your own risk

set -x 
DIR=$(pwd)

cd "$DIR"

rename JPG jpg *.JPG

mkdir "./resized"

for i in `ls *.jpg`; do exiftool -all= -overwrite_original -tagsfromfile @ -exif:Orientation  $i; done

for i in `ls *.jpg`; do convert $i -resize 20% "$DIR"/resized/$i; done

