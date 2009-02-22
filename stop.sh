#!/bin/bash

for file in ./pid/*; do
  PID=`cat $file` 
  kill $PID
  echo Killed Ramaze with pid $PID
done


