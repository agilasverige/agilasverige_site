#!/bin/bash

for file in ./pid/*; do
  PID=`cat $file` 
  kill -1 $PID
  echo Killed Ramaze with pid $PID
done


