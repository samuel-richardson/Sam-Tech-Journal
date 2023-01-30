#!bin/bash

hostnetwork=$1
dns=$2

echo "dns resolution for $hostnetwork"
#Run scan and output to file or default location
for i in $(seq 1 254); do
	nslookup $hostnetwork.$i $dns | grep name 
done

#Prints output
#cat $outputfile
