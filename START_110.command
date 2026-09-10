#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

printf '\n==========================================\n'
printf '  110 GOD MODE · SAFE LOCAL LAUNCH\n'
printf '==========================================\n\n'

# Never expose this dev server to the LAN from this launcher.
unset HOST
export PUPPETEER_SKIP_DOWNLOAD=1

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required. Install Node 24.14+ or Node 26, then run this again."
  echo "https://nodejs.org/"
  read -r -p "Press Enter to close..."
  exit 1
fi

NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
NODE_VERSION="$(node -p 'process.versions.node')"

if [[ "$NODE_MAJOR" != "24" && "$NODE_MAJOR" != "26" ]]; then
  echo "Unsupported Node version: $NODE_VERSION"
  echo "God's Eye View currently supports Node 24.14+ or Node 26."
  read -r -p "Press Enter to close..."
  exit 1
fi

if [[ "$NODE_MAJOR" == "24" ]]; then
  NODE_MINOR="$(node -p 'process.versions.node.split(".")[1]')"
  if (( NODE_MINOR < 14 )); then
    echo "Node $NODE_VERSION is too old. Upgrade to Node 24.14+ or Node 26."
    read -r -p "Press Enter to close..."
    exit 1
  fi
fi

echo "✓ Node $NODE_VERSION"
echo "✓ Localhost-only launch enforced"
echo "✓ Puppeteer browser download disabled"
echo

echo "[1/4] Installing the repo's locked dependencies..."
npm ci

echo

echo "[2/4] Running setup/security policy checks..."
npm run doctor

echo

echo "[3/4] Running unit tests..."
npm test

echo

echo "[4/4] Building production bundle..."
npm run build

echo
printf 'All gates passed. Opening 110 God Mode locally.\n'
printf 'URL: http://localhost:4173\n\n'

# Vite is deliberately left bound to its localhost default.
(sleep 2; open "http://localhost:4173") >/dev/null 2>&1 &
npm run dev
