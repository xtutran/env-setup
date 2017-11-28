#!/usr/bin/env bash

BASE_DIR="$(cd "`dirname "$0"`"; pwd)"
LOG_DIR=$BASE_DIR/logs
if [ ! -d "$LOG_DIR" ]; then
	mkdir $LOG_DIR
fi

nohup jupyter notebook 1>$LOG_DIR/notebook.out 2>&1 & echo $! > $BASE_DIR/run.pid

if [ $? -eq 0 ]; then
	# list running notebook (just for info)
	sleep 5
	jupyter notebook list
fi

