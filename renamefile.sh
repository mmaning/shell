#!/bin/bash
# rename file extension from xml to html. 

for file in *.xml ; 
do 
b=basename $file .xml  # remove the .xml file extension
echo mv $file $b.html
done
