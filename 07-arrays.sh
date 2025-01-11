#!/bin/bash

Movies=("ok" "notok" "done")
echo ${Movies[0]}
echo ${Movies[1]}
echo ${Movies[2]}

echo ${Movies[@]}
echo ${Movies[$#]}