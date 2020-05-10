#!/bin/bash
# Uses PuppetDB to wrap around pssh and allow arbitrary commands to be run through ssh.

all_nodes=`curl --silent -X GET http://puppetdb.domain.com:8080/v3/nodes | grep name | awk -F "\"" '{print $4}' | sort -n`

echo -n "Grep in hostnames ('slcd', 'brx0', etc): "
read grepexpr
if [ -z "$grepexpr" ]
then
  exit 1
else
  less_nodes=`echo "$all_nodes" | grep $grepexpr`
fi

echo -n "Command ('date', 'sudo rm -rf /', etc): "
read COMMAND
if [ -z "$COMMAND" ]
then
  exit 1
fi

echo -n "How many jobs in Parallel? [20]: "
read PARALLEL
if [ -z "$PARALLEL" ]
then
  PARALLEL=20
fi


echo "$less_nodes"
echo -n "Run '$COMMAND' on above hosts? [Y/n]: "
read yn
if [ "$yn" == "n" ]
then
  exit 1
fi

tempfile=$(mktemp)
trap 'rm -f "$tempfile"' EXIT INT TERM HUP
#echo "tempfile: $tempfile"
echo "$less_nodes" > $tempfile

pssh -t 1000 -p $PARALLEL -i -h $tempfile -O=StrictHostKeyChecking=no -O=UserKnownHostsFile=/dev/null -O=LogLevel=quiet $COMMAND
logger "pssh_wrapper parallel=$PARALLEL grepexpr=$grepexpr command=$COMMAND"
