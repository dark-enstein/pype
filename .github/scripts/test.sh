#! /bin/bash

echo "------------------------- PYPE TESTING BEGINS -------------------------"

alias pype='python3 $(pwd)/pype.py'

# shellcheck disable=SC2046

if ! sh setup.sh >> /dev/null; then
  echo 1. Setup script run correctly: Fail
else
  echo 1. Setup script run correctly: Pass
fi

result_not=$(pype request; echo $?)
result=$(pype requests; echo $?)

if [[ result_not -eq 1 ]]
then
  echo 2. Returns exit code 1 on not found: Pass
else
  echo 2. Returns exit code 1 on not found: Fail
fi

if [[ result -eq 0  ]]
then
  echo 3. Returns exit code 0 on found: Pass
else
  echo 3. Returns exit code 0 on found: Fail
fi