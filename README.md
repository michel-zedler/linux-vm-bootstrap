Convenience scripts that provide a baseline setup of linux virtual machine guests
in a virt-manager/qemu/libvirt setup with spice display server.

Setup comprises:

* update installed packages
* install spice-vdagent and git
* generate ssh keypair

Further setup steps are intentionally left out of scope.

## Usage

Prerequisite: virt-manager/qemu/libvirt on your host system.
Please refer to external resources for setup or check: https://github.com/michel-zedler/linux-vm-bootstrap/tree/main/setup-host

Download the guest iso; The setup scripts in this repo are tested with:

* [Ubuntu 22.04.2 LTS](https://ubuntu.com/download/desktop/thank-you?version=22.04.2&architecture=amd64)
* [Manjaro KDE](https://download.manjaro.org/kde/22.0.5/manjaro-kde-22.0.5-minimal-230316-linux61.iso)

Create and run a new virtual machine.

Open a terminal in the guest and run:

    . /etc/os-release
    bash <(wget -qO- --header="Cache-Control: no-cache" "https://raw.githubusercontent.com/michel-zedler/linux-vm-bootstrap/main/setup-guest/setup-guest-$ID.bash")

As guest/host clipboard sharing is currently broken for vanilla Manjaro KDE guests you might need to (auto-)type the above.
Clipboard sharing is fixed by the setup scripts and effective after a guest reboot.

Scripts are interactive and not meant to be run unattended.
Reminder to carefully inspect sources before executing any scripts off the Internet.

[MIT licensed](LICENSE). 
