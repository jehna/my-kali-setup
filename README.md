# My Kali setup

## Setup

Download VPN config to kali-dpkg-packages/universal.ovpn

## Install

Install Kali VM to `/Users/$USER/Virtual Machines.localized/kalibyhand.vmwarevm/kalibyhand.vmx`.

Mount the `kali-dpkg-packages/` directory by hand (see
`mount-kali-dpkg-packages.sh`) and run `make install` to install the packages.
After this, the directory will be mounted automagically to the VM in subsequent
boots.

## Start

Start the VM in immutable mode with `./start.sh`.

Start the VM in mutable mode with `./update.sh`.

