Convenience scripts that provide a baseline setup of linux virtual machine guests
in a virt-manager/qemu/libvirt setup with spice display server.

Scope:

* update installed packages
* install spice-vdagent and git
* generate ssh keypair

Further setup steps are intentionally left out of scope.

At this point intended for personal use but [MIT licensed](LICENSE).
Reminder to carefully inspect sources before executing any scripts off the Internet.

## Usage

Setup virt-manager/qemu/libvirt on your host system.

Download the guest iso; Setup scripts are tested with:

* [Ubuntu 22.04.2 LTS](https://ubuntu.com/download/desktop/thank-you?version=22.04.2&architecture=amd64)
* [Manjaro KDE](https://download.manjaro.org/kde/22.0.5/manjaro-kde-22.0.5-minimal-230316-linux61.iso)

Create and run a new virtual machine.

Open a terminal in the guest and run:

    . /etc/os-release
    bash <(wget -qO- --header="Cache-Control: no-cache" "https://raw.githubusercontent.com/michel-zedler/linux-vm-bootstrap/main/setup-guest/setup-guest-$ID.bash")

Host/guest clipboard sharing is currently broken for (pre-setup) Manjaro KDE guests so you might need to (auto-)type the above.
This is fixed by the setup and effective after a guest reboot.

Scripts are interactive and not meant to be run unattended.