#!/usr/bin/env bash

set -e
set -x

sudo pacman -S --needed virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft

sudo usermod -a -G libvirt $USER

sudo systemctl enable libvirtd.service --now

virsh -c qemu:///system net-start default
virsh -c qemu:///system net-autostart default
virsh -c qemu:///system net-list --all

# Resources
# https://wiki.archlinux.org/title/QEMU
# https://wiki.manjaro.org/index.php/Virt-manager
# https://www.baeldung.com/linux/qemu-from-terminal
# https://forum.manjaro.org/t/how-to-setting-up-shared-folders-auto-resize-vm-and-clipboard-share-with-virt-manger/127490
