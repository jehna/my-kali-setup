#!/bin/bash
set -euo pipefail

PROXY_PORT=44555

LOCAL_IP="$(./scripts/get-vm-ip.sh)"

echo "Opening SOCKS proxy to port $PROXY_PORT ..."

ssh -N -D "$PROXY_PORT" "jehna@$LOCAL_IP"