#!/bin/bash
# for each sub directory, remove empty lines of all .txt files, then rename the .txt file to .sh

ls | while read dir ;
do 
    if [[ -d $dir ]] ; then
        for file in $dir/*.txt
        do
        #echo $file
        sed -i "" '/^$/d' $file  # remove empty lines
        b=`basename $file .txt`  
        mv $file $dir/$b.sh           # rename file from .txt to .sh
        done
    fi
done