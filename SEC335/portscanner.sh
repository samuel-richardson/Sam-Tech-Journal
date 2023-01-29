#!bin/bash

hostfile=$1
portfile=$2

# Makes an input for a file optional
outputfile=${3:-targetoutput.txt}
echo "host,port" > $outputfile

#Run scan and output to file or default location
for host in $(cat $hostfile); do
	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
			echo "$host,$port"
	done
done >> $outputfile

#Prints output
cat $outputfile
