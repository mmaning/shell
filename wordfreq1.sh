[ansible@host1 ~]$ echo " today today is today is a day cool day" \
| egrep -o "\b[[:alpha:]]+\b" \  # egrep -o print only match using extended rex, and each match per line
| awk '{count[$0]++} END{for (world in count) print world, count[world]}' \
| sort -k2nr
today 3
day 2
is 2
a 1
cool 1