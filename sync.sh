#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PICO_DIR="/Volumes/CIRCUITPY"


if [ ! -d $PICO_DIR ];then
	echo "PICO not connected"
	echo "exiting"
	exit
fi



function to_board () {

	cd $SCRIPT_DIR
	cp ./*py $PICO_DIR
	mkdir -p ${PICO_DIR}/lib/tmc
	cp -a ./tmc/ ${PICO_DIR}/lib/tmc

}

function to_git () {

	cd $PICO_DIR
	cp ./*py $SCRIPT_DIR
	cp ./lib/tmc $SCRIPT_DIR


}

if [[ "$1" == "to_board" ]];then
	to_board
elif [[ "$1" == "to_git" ]];then
	to_git
else
	echo "usage is $0 <to_board|to_git>"
fi

