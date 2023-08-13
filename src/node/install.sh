#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
NODE_VERSION=${VERSION}
echo "Starting script as user: $USERNAME"

set -e

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    else
        echo "apt-get update already run, skipping..."
    fi
}

check_packages() {
    echo "Checking packages: $@"
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        echo "Packages not found, installing..."
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    else
        echo "Packages already installed, skipping..."
    fi
}

# Clean up
echo "Cleaning up existing apt lists..."
rm -rf /var/lib/apt/lists/*

# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

#  Install dependencies packages
#-----------------------------------------------
echo "Installing dependency packages..."
check_packages curl ca-certificates software-properties-common build-essential gnupg2 libreadline-dev \
    procps dirmngr gawk autoconf automake bison libffi-dev libgdbm-dev libncurses5-dev \
    libsqlite3-dev libtool libyaml-dev pkg-config sqlite3 zlib1g-dev libgmp-dev libssl-dev


#  Install nodenv
#-----------------------------------------------
echo "Installing nodenv..."
if [[ ! -d "/usr/local/share/nodenv" ]]; then
    git clone --depth=1 \
        -c core.eol=lf \
        -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        https://github.com/nodenv/nodenv.git /home/${USERNAME}/.nodenv
fi

echo "Installing node-build..."
if [[ ! -d "/usr/local/share/node-build" ]]; then
    mkdir -p /root/.nodenv/plugins
    mkdir -p /home/${USERNAME}/.nodenv/plugins
    git clone --depth=1 \
        -c core.eol=lf \
        -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        https://github.com/nodenv/node-build.git /usr/local/share/node-build
    ln -s /usr/local/share/node-build /root/.nodenv/plugins/node-build
    ln -s /usr/local/share/node-build /home/${USERNAME}/.nodenv/plugins/node-build
fi

echo "Setting up nodenv..."
echo 'export PATH=$PATH:$HOME/.nodenv/bin' >> /home/${USERNAME}/.bashrc
echo 'eval "$(${HOME}/.nodenv/bin/nodenv init - bash)"' >> /home/${USERNAME}/.bashrc
chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.nodenv
chmod -R 755 /home/${USERNAME}/.nodenv

#  Install node.js
#-----------------------------------------------
echo "Installing node.js..."
sudo -u ${USERNAME} -H sh -c "/home/${USERNAME}/.nodenv/bin/nodenv install ${NODE_VERSION}"
sudo -u ${USERNAME} -H sh -c "/home/${USERNAME}/.nodenv/bin/nodenv global ${NODE_VERSION}"

#  Setup onCreateCommand
#-----------------------------------------------
if [ ! -d "/home/${USERNAME}/.onCreateCommand" ]; then
  echo "Creating .onCreateCommand directory..."
  mkdir -p /home/${USERNAME}/.onCreateCommand
fi
cp onCreateCommand /home/${USERNAME}/.onCreateCommand/node

# Clean up
echo "Final clean up..."
rm -rf /var/lib/apt/lists/*

echo "Done!"
