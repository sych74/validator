#!/bin/bash
IFS=',' read -r -a nodes <<< "$1"
for node in "${nodes[@]}"
do
  NETPATH=`traceroute -m4 -n $node 2>/dev/null | awk '{print $2}' | grep -v to`
  [[ `echo $NETPATH` =~ ${0##*/} ]] && echo "VALIDATOR ERROR: Failed connect to " `host ${node}` ": Traceroute out: ${NETPATH} "
done
exit 0
