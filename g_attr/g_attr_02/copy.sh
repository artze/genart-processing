#!/bin/bash

for i in $(seq -f "%04g" 1 800); do
  output_seq=$(( 800 - 10#$i + 1 ))
  printf -v output_name "%04d" $output_seq
  cp "./output_01/$i.png" "./output_01-reversed/$output_name.png"
done