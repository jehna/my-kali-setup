#!/bin/bash

VM_PATH="./.sessions/kalibyhand-sesion.vmx"

if [ ! -f "$VM_PATH" ]; then
  VM_PATH="/Users/$USER/Virtual Machines.localized/kalibyhand.vmwarevm/kalibyhand.vmx"
fi

vmrun -T fusion getGuestIPAddress "$VM_PATH" -wait