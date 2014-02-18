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

#backup the directories first
for directory in $(find $downloads/* -maxdepth 0 -type d)
do
  #omit the backup directory
  if [ "$(basename $directory)" == "$backup" ]
  then
    echo "$directory"
  else
    mv $directory $downloads/$backup/$today/
  fi
done

#then the files
for file in $(find $downloads/* -maxdepth 1 -type f)
do
    mv $file $downloads/$backup/$today/
done
