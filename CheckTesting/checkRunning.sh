#!/bin/bash


export front=false
export back=false

if ! ($back && $front)  ; then
	echo "Checking Testing Environment..."
fi

while true
do
	curl -s https://ebs.testing.kites-software.io:8050/login -k > backend.txt

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
	curl -s http://ebs.testing.kites-software.io > frontend.txt
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
	echo "--------- TESTING ENVIRONMENT IS RUNNING! -----------"
fi

sleep 1000




