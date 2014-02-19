#!/usr/bin/bash

downloads=~/Downloads
today=$(date +%m-%d)
#the name of your backup dir
backup="backup"

echo $today
#check to see if the backup directory exists
if [ ! -d $downloads/$backup ]; then
  mkdir $downloads/$backup
fi
#check to see if todays directory exists
if [ ! -d $downloads/$backup/$today ]; then
  mkdir $downloads/$backup/$today
fi

find $downloads/* -maxdepth 0 -type d|while read directory;do
  #omit the backup directory
  if [ "$(basename $directory)" == "$backup" ]
  then
    echo "$directory"
  else
    mv "$directory" $downloads/$backup/$today/
  fi
done

find $downloads/* -maxdepth 0 -type f|while read file; do
    mv "$file" $downloads/$backup/$today/
done
