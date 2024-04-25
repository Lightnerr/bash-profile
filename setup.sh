#!/bin/bash

profileUrl="https://raw.githubusercontent.com/Lightnerr/bash-profile/main/.bashrc"

# Function to test internet connectivity
function test_internet {
    echo "Testing internet connectivity..."
    if ping -q -c 1 -W 1 google.com >/dev/null; then
        echo "Connected to the internet."
    else
        echo "Not connected to the internet. Please connect to the internet and try again."
        exit 1
    fi
}

# Check for internet connectivity before proceeding
test_internet

# bashrc profile creation or update
if [ -f ~/.bashrc ]; then
    echo "Backing up existing .bashrc file..."
    mv ~/.bashrc ~/.bashrc.bak
fi

echo "Downloading .bashrc file..."
curl -s $profileUrl -o ~/.bashrc
echo "The profile has been successfully installed."

# Install required packages
sudo apt update
sudo apt install -y curl git unzip

# Oh My Posh installation
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Reload the bash profile
source ~/.bashrc
