# My Kali setup
> A collection of tools that make using Kali linux better

This repository contains packages that help me configure my Kali Linux setup and
to run in in an immutable container. It runs on VMWare fusion by creating a
session that's discarded on logout.

## Install

Install Kali VM to `/Users/$USER/Virtual Machines.localized/kalibyhand.vmwarevm/kalibyhand.vmx`.

Mount the `kali-dpkg-packages/` directory by hand (see
`mount-kali-dpkg-packages.sh`) and run `make install` to install the packages.
After this, the directory will be mounted automagically to the VM in subsequent
boots.

## Start

Start the VM in immutable mode with `./start.sh`.

Start the VM in mutable mode with `./update.sh`.

SSH to the container with `./ssh.sh`

## Config

### auto-vpn

Download your VPN config to `kali-dpkg-packages/universal.ovpn`. The VPN is
connected automatically when the machine boots.