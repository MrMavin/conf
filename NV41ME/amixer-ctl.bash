#!/bin/bash

while [ true ]
do
  amixer sset "Capture" 32 >> /dev/null
  amixer sset "Mic Boost" 0 >> /dev/null
  amixer sset Digital 0 >> /dev/null

  sleep 1
done


