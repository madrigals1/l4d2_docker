#!/usr/bin/env bash
set -euo pipefail

# Load .env
if [[ -f .env ]]; then
  # shellcheck disable=SC1091
  source .env
else
  echo ".env file not found" >&2
  exit 1
fi

: "${PORT:?PORT is not set in .env}"

# Get WSL IPv4 address
IP=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

echo "connect ${IP}:${PORT}"
