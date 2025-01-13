#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ $# -lt 2 ]; then
    echo "you need to have <SOURCE_DIRECTORY> and <DEST_DIRECTORY> to execue this script"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "you need to have <SOURCE_DIRECTORY> please check "
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo "you need to have <DEST_DIRECTORY> to execue this script"
    exit 1
fi

Files=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$Files" ]; then
    echo " files are :: $Files"
   Zip_File="$DEST_DIR/archives.logs-$TIMESTAMP.zip"
   find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$Zip_File"
   if [ -n $Zip_File ];then
   echo "started zipping the files..."
   echo "zipping the files are done.."
  
   while read -r file
   do 
    echo "deleting the file "
    rm -rf $file
        echo "deleted the file "
        exit 1
   else
   echo " failed to zip the file"
   fi

else
    echo "there no files to zip"
fi
