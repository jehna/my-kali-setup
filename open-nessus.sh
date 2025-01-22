#!/bin/bash

IP="$(./scripts/get-vm-ip.sh)"

open "https://${IP}:8834"
