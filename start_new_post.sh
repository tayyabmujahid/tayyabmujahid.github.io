#!/bin/bash

PTITLE=$1
TDATE=$(date +'%Y-%m-%d')
#function to create file name a and check for ext
add_ext () {
  FILENAME="${TDATE}-${PTITLE}"
  echo $FILENAME
  if [[ $FILENAME != *".md"* ]]; then
    FILENAME+=".md"
  fi
}

#check add .md ext to post filename
add_ext


#create post using hugo
FFNAME="./posts/${FILENAME}"
hugo new --kind post $FFNAME

#check if post file is created
ABSPATH="content/${FFNAME}"
if [[ -f $ABSPATH ]]; then
    echo "$ABSPATH created."
fi
