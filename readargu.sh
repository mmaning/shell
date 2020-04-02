#!/bin/bash
# script that shows how to make sure that user input is provided

if [ -z $1 ]
then
	echo provide arguments
	read ARGNAMES
else
	ARGNAMES="$@"
fi

echo the following arguments have been provided: $ARGNAMES

