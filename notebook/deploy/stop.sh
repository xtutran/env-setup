#!/usr/bin/env bash

BASE_DIR="$(cd "`dirname "$0"`"; pwd)"
pid=$(cat $BASE_DIR/run.pid)

if [ $? -eq 0 ]; then
	echo Kill process: $pid
	kill -9 $pid
else
	echo Cannot find notebook pid! Check $BASE_DIR/run.pid
fi

# for info
jupyter notebook list

