#!/bin/bash
IP="$RESERVED_IP"
ID=$(curl -s http://169.254.169.254/metadata/v1/id)
HAS_RESERVED_IP=$(curl -s http://169.254.169.254/metadata/v1/reserved_ip/ipv4/active)

if [ $HAS_RESERVED_IP = "false" ]; then
    n=0
    while [ $n -lt 10 ]
    do
        python3 /usr/local/bin/assign-ip $IP $ID && break
        n=$((n+1))
        sleep 3
    done
fi