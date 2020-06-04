#!/bin/bash

#rando script for prepping image files. requires exiftools and argument input. use at your own risk

count=1
DIR=$(pwd)

# error if no argument supplied
[ $# -eq 0 ] && { echo "Usage: `basename $0` <desired filename>"; exit 1; }

cd "$DIR"

if  [ -f *.JPG ];
  then
  rename 'y/A-Z/a-z/' *.JPG
else
  echo no uppercase jpg files found - good
fi
 

mkdir -p "./resized"

num=1
for i in `ls *.jpg`; do mv $i $1-$num.jpg; num=$((num+1)); done
for i in `ls *.jpg`; do exiftool -all= -overwrite_original -tagsfromfile @ -exif:Orientation  $i; done
for i in `ls *.jpg`; do convert $i -resize 50% ${i%.*}-m.jpg; echo file copied and resized to 50%; done
for i in `ls *.jpg`; do convert $i -resize 20% "$DIR"/resized/$i; done
