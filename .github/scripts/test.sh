#! /bin/bash

echo "------------------------- PYPE TESTING BEGINS -------------------------"

alias pype='python3 $(pwd)/pype.py'

if ! . setup.sh >> /dev/null; then
  echo 1. Setup script run correctly: Pass
else
  echo 1. Setup script run correctly: Fail
fi

result_not=$(pype request; echo $?)
result=$(pype requests; echo $?)

if [[ result_not -eq 1 ]]
then
  echo 2. Returns exit code 1 on not found: True
else
  echo 2. Returns exit code 1 on not found: False
fi

if [[ result -eq 0  ]]
then
  echo 3. Returns exit code 0 on found: True
else
  echo 3. Returns exit code 0 on found: False
fi