#!/bin/bash

# take an input file and remove identical lines (or duplicate lines from the file)

cat $1 | sort |
while read line
do
 if [[ "$prev" != "$line" ]]
 then
 echo $line >> sorted.txt
 fi
 prev=$line
done 