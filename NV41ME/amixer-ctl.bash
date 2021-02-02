#!/bin/bash


while [ true ]
do
  amixer sget "Capture" | grep 50 >> /dev/null || amixer sset "Capture" 50 >> /dev/null

  AMIXER_MIC_BOOST=$(amixer sget "Mic Boost" | grep "Front")
  AMIXER_DIGITAL=$(amixer sget "Digital" | grep "Front")

  if [[ $AMIXER_MIC_BOOST != *"[0%]"* ]]; then
      amixer sset "Mic Boost" 0 >> /dev/null
  fi


  if [[ $AMIXER_DIGITAL != *"[0%]"* ]]; then
      amixer sset Digital 0 >> /dev/null
  fi

  sleep 1
done


