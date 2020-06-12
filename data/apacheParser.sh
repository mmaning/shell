#! /bin/bash

a="`awk '{print $1,$4}' access10.log | sed 's/\.[0-9]* \[[0-9]*\// /g'|awk -F: '{print $1}'|sort -r -k 2`"

dates=`echo "$a"|awk '{print $2}'|sort -u`
for date in $dates
do
out_put="`echo "$a"|grep "$date"|sort |uniq -c|sort -rn|head -2`"
echo "$date ====="
echo "$out_put"
echo ""
done