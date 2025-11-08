#!/bin/bash

# Splunk Lab Installation Script
# Automates Splunk Enterprise setup on Ubuntu

set -e

echo "======================================="
echo "    Splunk Lab Setup Installation"
echo "======================================="

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo"
    exit 1
fi

# Update system
echo "[1/6] Updating system packages..."
apt update

# Install dependencies
echo "[2/6] Installing dependencies..."
apt install -y wget binutils

# Download Splunk
echo "[3/6] Downloading Splunk Enterprise..."
wget -O splunk-9.3.0.deb "https://download.splunk.com/products/splunk/releases/9.3.0/linux/splunk-9.3.0-51ccf43db5bd-linux-2.6-amd64.deb"

# Install Splunk
echo "[4/6] Installing Splunk..."
dpkg -i splunk-9.3.0.deb
apt-get install -f

# Configure Splunk
echo "[5/6] Configuring Splunk..."
/opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd "ChangeThisPassword123"
/opt/splunk/bin/splunk enable boot-start

# Cleanup
echo "[6/6] Cleaning up..."
rm splunk-9.3.0.deb

echo "======================================="
echo "    Installation Complete!"
echo "======================================="
echo "Splunk is now running at: http://localhost:8000"
echo "Username: admin"
echo "Password: ChangeThisPassword123"
echo ""
echo "Next steps:"
echo "1. Change the default password"
echo "2. Configure data inputs"
echo "3. Set up indexes and users"
