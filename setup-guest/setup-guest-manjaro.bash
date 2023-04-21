#!/usr/bin/env bash

set -e
set -x

# update installed packages

sudo pacman -Syu

# install required packages

sudo pacman -S --needed spice-vdagent xf86-video-qxl

# workaround: clipboard not shared because spice-vdagentd does not start
# see https://github.com/systemd/systemd/issues/18791
# see https://bugzilla.redhat.com/show_bug.cgi?id=1951580
# see https://forum.endeavouros.com/t/kde-refuses-to-start-spice-vdagent-on-login/33579

sudo systemctl status spice-vdagentd || true
sudo sed -i.bak '/X-GNOME-Autostart-Phase/d' /etc/xdg/autostart/spice-vdagent.desktop

# generate ssh keypair

sshComment="$(whoami)@$(hostname)_$(date -I)"
sshPrivateKeyName="id_ed25519"
sshPublicKeyName="${sshPrivateKeyName}.pub"

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
ssh-keygen -t ed25519 -C $sshComment -f $sshPrivateKeyName || true
chmod 600 $sshPrivateKeyName $sshPublicKeyName
sshPublicKey="$(cat $sshPublicKeyName)"

cat <<END >&2

Public ssh key:
========================================================================================================================
$sshPublicKey
========================================================================================================================

END

echo "Please reboot guest"
