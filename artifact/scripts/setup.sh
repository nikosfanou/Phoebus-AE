#!/bin/bash

set -e

# Directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Root directory of the artifact
ARTIFACT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Run all setup commands from the artifact root
cd "$ARTIFACT_DIR"

# Install Prerequisities

# Install Python
./scripts/install_python.sh

# Install Docker
./scripts/install_docker.sh

# Install Apache
./scripts/install_apache.sh


# Install Dependencies

# Install cloc for counting lines of code on TestGenerator
sudo apt install -y cloc

# Install xvfb for virtual display
if ! command -v Xvfb >/dev/null 2>&1; then
    echo "Xvfb not found. Installing..."
    sudo apt update
    sudo apt install -y xvfb
else
    echo "Xvfb is already installed."
fi

# Install needed python packages
python3 -m pip install -r requirements.txt

# to be able to modify localhost apache files without sudo:
sudo usermod -a -G www-data $(whoami)
sudo chown -R :www-data /etc/apache2
sudo chmod -R g+w /etc/apache2
sudo mkdir /var/www/localhost
sudo chown -R :www-data /var/www/localhost
sudo chmod -R g+w /var/www/localhost
sudo mkdir /usr/lib/apache2/api
sudo chown -R :www-data /usr/lib/apache2/api
sudo chmod -R g+rwx /usr/lib/apache2/api
sudo chown -R :www-data /var/lib/apache2
sudo chmod -R g+w /var/lib/apache2
sudo chown -R :www-data /var/log/apache2
sudo chmod -R g+w /var/log/apache2

# to be able to restart apache2 server on localhost without password
cat <<EOF | sudo tee /etc/sudoers.d/apacherestart
$(whoami) ALL=NOPASSWD: $(whereis systemctl | awk '{print $2}') restart apache2.service 
EOF

# to be able to run docker commands without sudo
sudo usermod -a -G docker $(whoami)
echo "You may need to log out and back in before Docker can be used without sudo."

# Create certificates folder
mkdir -p ./certs

# Generate Certification Authority (CA)
python3 env-setup.py --create_ca

# Before running trust_ca.sh, we need to run mitmproxy once to generate its ca if not already generated
timeout 1s ~/.local/bin/mitmdump --set console_eventlog_verbosity=error --quiet

# Add CA on browsers' trusted CA
if ! dpkg -s libnss3-tools >/dev/null 2>&1; then
    sudo apt-get install -y libnss3-tools
fi

echo "WARNING: Install and launch supported browsers before running trust_ca.sh."
./scripts/trust_ca.sh

# Create custom apache image that has php installed and configured
sudo docker build -t custom-httpd-image -f ./dockerfiles/apache/Dockerfile .
echo "Setup completed!"
