#!/bin/bash
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
absdir=`dirname "$abspath"`

for i in "commands"/*
do
  if [ ! -d $absdir/${i} ]
  then
    echo "Warning: No commands for command container: " $absdir/${i}
    exit
  fi
  if [ $1 == "clean" ]
  then
    echo "Cleaning: $PWD/$i"
  else
    echo "Building: $PWD/$i"
  fi
  cd $absdir/${i} && make $@
done

cd $absdir

