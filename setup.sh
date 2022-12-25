#! /bin/bash

echo "This is built ideally for a cicd tooling where you can ensure that the python version installed"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install python3-pip -y

profile=~/.pype_profile

echo "Installing python dependencies"
pip3 install -r requirements.txt

init_pype() {
    if grep -q "alias pype='python3 $(pwd)/pype.py'" $profile; then
      echo pype already installed
    else
      echo "alias pype='python3 $(pwd)/pype.py'" >> $profile
      . $profile
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