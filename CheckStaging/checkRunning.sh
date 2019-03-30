#!/bin/bash


export front=false
export back=false

if ! ($back && $front)  ; then
	echo "Checking Staging Environment..."
fi

while true
do
	sudo ssh -i Kites-Key-Pair.pem ec2-user@34.248.218.83 "(sudo docker ps -a > sample.txt || echo Connecting...) && ((wc -l < sample.txt) > count.txt || echo ) && (./checkContainers.sh || echo)" > containerOutput.txt || echo "Waiting for EC2 Machine..."
	input="containerOutput.txt"
	while IFS= read -r var
	do
		echo $var
		if [[ $var == *"Containers are up"* ]] ; then
			break 2
		fi
	done < "$input"
	sleep 2
done

while true
do
	curl -s http://ebs.staging.kites-software.io:8050/login > backend.txt

	input="backend.txt"
	while IFS= read -r var
	do
		if [[ $var == *"Al Madina for Advanced Technology"* ]] ; then
			export back=true
			break 2
		fi
	done < "$input"

	sleep 2
done

while true
do
	curl -s http://ebs.staging.kites-software.io > frontend.txt
	input="frontend.txt"
	while IFS= read -r var
	do
		if [[ $var == *"Ebsfrontend"* ]] ; then
			export front=true
			break 2
		fi
	done < "$input"

	sleep 2
done

if $back && $front ; then
	echo "--------- STAGING ENVIRONMENT IS RUNNING! -----------"
fi

sleep 1000