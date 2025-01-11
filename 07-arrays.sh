#!/bin/bash

Movies=("ok" "notok" "done")
echo ${Movies[0]}
echo ${Movies[1]}
echo ${Movies[2]}

echo ${Movies[@]}
echo $0
echo $PWD 
echo $HOME
echo $USER 
echo $$
sleep 60 &
echo $!