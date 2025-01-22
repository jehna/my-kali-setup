#!/bin/bash
set -eoa pipefail

TARGET_VM="/Users/$USER/Virtual Machines.localized/kalibyhand.vmwarevm/kalibyhand.vmx"
SESSIONS_DIR=".sessions"

rm -rf "$SESSIONS_DIR"
mkdir -p "$SESSIONS_DIR"

vmrun -T fusion clone "$TARGET_VM" "$SESSIONS_DIR/kalibyhand-sesion.vmx" linked -cloneName="kalibyhand-session"

function cleanup() {
  echo "Cleaning up..."
  vmrun -T fusion stop "$SESSIONS_DIR/kalibyhand-sesion.vmx" || true
  while vmrun -T fusion list | grep -q "kalibyhand-sesion"; do sleep 1; done
  vmrun -T fusion deleteVM "$SESSIONS_DIR/kalibyhand-sesion.vmx"
  exit 0
}

# Clean up on script exit
trap 'cleanup' EXIT


# Start the cloned VM
vmrun -T fusion start "$SESSIONS_DIR/kalibyhand-sesion.vmx"

# wait for the VM to stop
while vmrun -T fusion list | grep -q "kalibyhand-sesion"; do
  sleep 10
done

cleanup
