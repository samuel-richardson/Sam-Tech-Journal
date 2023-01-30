#!bin/bash

hostnetwork=$1
port=$2

echo "ip,port"
#Run scan and output to file or default location
for i in $(seq 1 254); do
	timeout .1 bash -c "echo >/dev/tcp/$hostnetwork.$i/$port" 2>/dev/null &&
		echo "$hostnetwork.$i,$port"
done

#Prints output
#cat $outputfile
