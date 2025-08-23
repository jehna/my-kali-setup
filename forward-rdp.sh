#!/bin/bash

IP="$1"

if [ -z "$IP" ]; then
  echo "Usage: forward-rdp.sh <IP>"
  exit 1
fi

LOCAL_IP="$(./scripts/get-vm-ip.sh)"

ssh -N -L "3389:$IP:3389" "jehna@$LOCAL_IP"
