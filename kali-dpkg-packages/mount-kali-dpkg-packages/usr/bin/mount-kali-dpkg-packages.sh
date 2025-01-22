#!/bin/bash

mkdir -p /kali-dpkg-packages
vmhgfs-fuse .host:/kali-dpkg-packages /kali-dpkg-packages -o subtype=vmhgfs-fuse,allow_other