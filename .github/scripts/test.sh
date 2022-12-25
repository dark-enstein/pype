#! /bin/bash

echo "------------------------- PYPE TESTING BEGINS -------------------------"

#---
alias pype='python3 $(pwd)/pype.py'
rc=/tmp/rcii
echo 'shopt -s expand_aliases' > $rc
echo 'alias pype="python3 pype.py" ' >> $rc
source /tmp/rcii
#---

# shellcheck disable=SC2046

if ! sh setup.sh >> /dev/null; then
  echo 1. Setup script run correctly: Fail
else
  echo 1. Setup script run correctly: Pass
fi

result_not=$(python3 pype.py request; echo $?)
result=$(python3 pype.py requests; echo $?)

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
