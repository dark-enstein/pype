#! /bin/bash

echo "This is built ideally for a cicd tooling where you can ensure that the python version installed"
profile=~/.pype_profile
init_pype() {
    if grep -q "alias pype='python3 $(pwd)/pype.py'" $profile; then
      echo pype already installed
    else
      echo "alias pype='python3 $(pwd)/pype.py'" >> $profile
      source $profile
      echo Done
    fi
}
sleep 1

if [ -f $profile ]; then
  init_pype
else
  touch $profile
  init_pype
fi