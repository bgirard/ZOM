#!/bin/bash
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
absdir=`dirname "$abspath"`

for i in "commands"/*
do
  if [ $1 == "clean" ]
  then
    echo "Cleaning: $i"
  else
    echo "Building: $i"
  fi
  cd $absdir/${i} && make $@
done

cd $absdir

