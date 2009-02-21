#!/bin/bash

INSTANCES=3
STARTING_PORT=3000

for((i=0; i < INSTANCES; i++)) do
  let port=$STARTING_PORT+$i
  ramaze -p $port --adapter mongrel &
  echo $! > ./pids/$port.pid
  echo Started Ramaze on port $port
done


