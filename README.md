<div align="center"><img src="https://github.com/jehna/my-kali-setup/blob/main/logo.png?raw=true" width="200" height="200"></div>

# My Kali setup
> A collection of tools that make using Kali linux better

This repository contains packages that help me configure my Kali Linux setup and
to run in in an immutable container. It runs on VMWare fusion by creating a
session that's discarded on logout.

## Getting started

Install Kali VM to `/Users/$USER/Virtual Machines.localized/kalibyhand.vmwarevm/kalibyhand.vmx`.

Mount the `kali-dpkg-packages/` directory by hand (see
`mount-kali-dpkg-packages.sh`) and run `make install` to install the packages.
After this, the directory will be mounted automagically to the VM in subsequent
boots.

## Usage

Start the VM in immutable mode with `./start.sh`.

Start the VM in mutable mode with `./update.sh`.

SSH to the container with `./ssh.sh`

## Features

This project helps to:
* Have my configurations in a reproducible, version controlled place
* Develop custom tools
* Automate everything for easy setup

## Configuration

### auto-vpn

Download your VPN config to `kali-dpkg-packages/universal.ovpn`. The VPN is
connected automatically when the machine boots.

## Contributing

This repo is meant to be just for my own fun, but please do steal and improve on
any scripts and configs I have here. Pull requests are always warmly welcome.

## Licensing

The code in this project is licensed under MIT license.