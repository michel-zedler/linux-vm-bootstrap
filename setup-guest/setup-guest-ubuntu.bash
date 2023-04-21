#!/usr/bin/env bash

set -e
set -x

# update installed packages

sudo apt-get update
sudo apt-get upgrade

# install required packages

sudo apt-get install git spice-vdagent

# run common/shared setup steps

. common/ssh-keypair.bash

echo "Please reboot guest"