#!/bin/bash
j=0;
while true; 
do
	pid=$(pidof ffmpeg);
	if ! [ -z "$pid" ] ; then
		echo $pid && ps -p $pid -o %cpu,%mem,cmd | tail -n 1
	fi
	sleep 2;
done
