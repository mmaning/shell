#!/bin/bash
[[ -z $1 ]] && echo you must provide a group name && exit 1

# get the group GID

GID=$(grep ^$1 /etc/group | cut -d : -f3)
echo GID is $GID

# get user
# awk -v pass shell variable to awk 
# if $4 GID matches, then print $1 username 
awk -F ":" -v val="$GID" '$4 == val {print $1}' /etc/passwd
#awk -F ":" "/$GID/"'{print $1}' /etc/passwd
#grep $GID /etc/passwd | cut -d : -f1