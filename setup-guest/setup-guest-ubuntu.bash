#!/usr/bin/env bash

set -e
set -x

# update installed packages

sudo apt-get update
sudo apt-get upgrade

# install required packages

sudo apt-get install git spice-vdagent

# generate ssh keypair

sshComment="$(whoami)@$(hostname)_$(date -I)"
sshPrivateKeyName="${sshComment}_key"
sshPublicKeyName="${sshPrivateKeyName}.pub"

mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -t ed25519 -C $sshComment -f $sshPrivateKeyName || true
sshPublicKey="$(cat $sshPublicKeyName)"

cat <<END >&2

Public ssh key:
========================================================================================================================
$sshPublicKey
========================================================================================================================

END

echo "Please reboot guest"