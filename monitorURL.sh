# Monitor a given URL

#1. take a URL as argument

if [[ $# != 1 || $1 == "-h" ]]; then
    echo "Usage $0 https://locus-a.wbx2.com/locus/api/v1/ping"
    exit 1
fi

while true
do
#2.Retrieve doc and print out HTTP status

    URL=$1
    LOG=./$0-$$.log
    # HTTPCODE=$(curl -s -o /dev/null -I -w "%{http_code}" $URL)

    # echo HTTP Return Code is: $HTTPCODE

    # Time the execution 

    START=$(date +%s)
    HTTPCODE=$(curl -s -o /dev/null -I -w "%{http_code}" $URL)
    END=$(date +%s)
    DIFF=$(( $END - $START ))
    echo "It took $DIFF seconds"
    echo HTTP Return Code is: $HTTPCODE

#3. If not 200 or longer than 5 sec, return error and 
#4. traceroute host

    TEMPHOST=${URL#*//}
    HOST=${TEMPHOST%%/*}

    if [[ $HTTPCODE != 200 || $DIFF -gt 5 ]]; then
    echo "HTTP Error: " $HTTPCODE "or timeout: " $DIFF
    echo "Trying traceroute $HOST"
    traceroute $HOST
    fi
    
    sleep 3
done






