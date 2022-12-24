#! /bin/bash

echo "Pype testing begins"

alias pype='python3 $(pwd)/pype.py'

if ! . setup.sh; then
  echo 1. Setup script exited with error
else
  echo 1. Setup script ran correctly
fi

result_not=$(pype request)
result=$(pype requests)
if test result_not == 404
then
  echo 2. Test pass
else
  echo 2. Test fail
fi

if test result == 200
then
  echo 3. Test pass
else
  echo 3. Test fail
fi