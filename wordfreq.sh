#!/bin/bash
#Name: word_freq.sh

#Desc: Fworld out frequency of words in a file
if [ $# -ne 1 ];
then
echo "Usage: $0 filename"
exit 1
fi

filename=$1

egrep -o "\b[[:alpha:]]+\b" $filename | \

awk '{ count[$0]++ }
END{ printf("%-14s%s\n","Word","Count") ;
for(world in count) { printf("%-14s%d\n",world,count[world])}
 }'