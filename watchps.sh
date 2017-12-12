#!/bin/bash

while true; do

TIME=$(date +%s)

/bin/ps axo lstart,pid,cmd 

	while read -r line
	do
		## 60 * 60  = 1h older than one hour
		if (( $(date -d "$(line:0:25)" +%s ) < $TIME - 60 * 60 ))
		then
			echo $line | cut -d ' ' -f 6
		fi

	done
	
sleep 30
done
