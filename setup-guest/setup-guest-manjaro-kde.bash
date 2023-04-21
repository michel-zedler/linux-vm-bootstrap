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

sudo systemctl status spice-vdagentd
sudo sed -i.bak '/X-GNOME-Autostart-Phase/d' /etc/xdg/autostart/spice-vdagent.desktop

# run common/shared setup steps

. common/ssh-keypair.bash

echo "Please reboot guest"