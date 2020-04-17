#! /bin/bash
# test git push from new laptop top
# Syntax check
if [[ $# != 1 || $1 == "-h" ]]; then
    echo "Usage $0 /etc/password"
    exit 1
fi

#Read command line argument into a variable
file=$1

parse_prompt(){
    until [[ ${answer} =~ yes|no ]] ; do # =~ operator uses regex pattern match
        echo "Do you wish to parse ${file} (yes|no)?"
        read answer
    done
    if [[ ${answer} == no ]] ; then
        echo "Exiting...."
        exit 0
    fi
}

parse_prompt

# Example line that we are parsing\
# puppet:x:52:52:Puppet:/Var/lib/puppet:/sbin/nologin

# Sort file by UID
# Loop through each line and match desired fields

sort -t ':' -k 3 -n $file | while read -r line ; do
    # Obtain the user name, UID and homedir
    user=$(echo $line | cut -f '1' -d ':')
    uid=$(echo $line | cut -f '3' -d ':')
    homedir=$(echo $line | cut -f '6' -d ':')
    echo "User ${user} has UID ${uid} and home directory ${homedir}"

    # use if and regex to print whether UID is at least 3 digit
    if [[ $uid == [0-9]{3} ]] ; then
    echo "This user has a UID with at least 3 digital!" ;
    fi
done
