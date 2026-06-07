#!/bin/bash
# MTProxyMax Quick Installer — SamNet Technologies
# Usage: curl -sL https://raw.githubusercontent.com/nxksxd/MTProxyMax/main/install.sh | sudo bash
set -e
REPO_BASE="https://raw.githubusercontent.com/nxksxd/MTProxyMax/main"
SCRIPT_URL="${REPO_BASE}/mtproxymax.sh"
LANG_DIR="/opt/mtproxymax/lang"

if [ "$(id -u)" -ne 0 ]; then
    echo "Run as root / Запустите от root: curl -sL $SCRIPT_URL | sudo bash" >&2
    exit 1
fi

# Download main script
curl -fsSL "$SCRIPT_URL" -o /tmp/mtproxymax.sh

# Download language files
mkdir -p "$LANG_DIR"
curl -fsSL "${REPO_BASE}/lang/en.sh" -o "${LANG_DIR}/en.sh"
curl -fsSL "${REPO_BASE}/lang/ru.sh" -o "${LANG_DIR}/ru.sh"

# Run installer
bash /tmp/mtproxymax.sh install
rm -f /tmp/mtproxymax.sh
