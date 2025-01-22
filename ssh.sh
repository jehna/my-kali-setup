#!/bin/bash

IP="$(./scripts/get-vm-ip.sh)"

ssh jehna@$IP
