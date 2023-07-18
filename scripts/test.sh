#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

arr=[]

arr[0]='red'
arr[2]='blue'

for i in ${!arr[@]}; do
  echo "element $i is ${arr[$i]}"
done

echo $arr