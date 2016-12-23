#!/bin/bash

if [ -e "speech.pid" ];then
    #Analyze your recorded voice command
    read PID_OF_SPEECH < speech.pid
    sleep .1 # This is so the end of the speech doesn't get cut off.
    kill $PID_OF_SPEECH

    while kill -s 0 $PID_OF_SPEECH 2>/dev/null;do
    :
    done

    rm speech.pid
else
    echo "You are in the else of hotkey_switch"
    #Record your voice command
    rec -r 16000 -c 1 speech.flac 2>/dev/null & 
    echo $! > "speech.pid"
    # Checks when recording starts
    while [ "$(stat -c%s speech.flac)" == "0" ];do
    	:
    done
fi
