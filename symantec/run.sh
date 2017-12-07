#!/usr/bin/env bash

while getopts ":hm:" opt; do
  case ${opt} in
    m )
      cmd=$OPTARG
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument [load|unload]" 1>&2
      ;;
    h ) echo "Usage: ./run.sh -m [load|unload]"
      ;;
  esac
done
shift $((OPTIND -1))

if [[ "$cmd" == "load" || "$cmd" == "unload" ]]; then
    sudo launchctl $cmd -w /Library/LaunchDaemons/com.symantec.symdaemon.plist
    sudo launchctl $cmd -w /Library/LaunchDaemons/com.symantec.sharedsettings.plist
    launchctl $cmd -w /Library/LaunchAgents/com.symantec.uiagent.application.plist
else
    echo "Invalid option: $cmd requires an argument [load|unload]" 1>&2
fi

