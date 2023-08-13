#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
RUBY_VERSION=${VERSION}
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


#  Install rbenv
#-----------------------------------------------
echo "Installing rbenv..."
if [[ ! -d "/usr/local/share/rbenv" ]]; then
    git clone --depth=1 \
        -c core.eol=lf \
        -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        https://github.com/rbenv/rbenv.git /home/${USERNAME}/.rbenv
fi

echo "Installing ruby-build..."
if [[ ! -d "/usr/local/share/ruby-build" ]]; then
    mkdir -p /root/.rbenv/plugins
    mkdir -p /home/${USERNAME}/.rbenv/plugins
    git clone --depth=1 \
        -c core.eol=lf \
        -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        https://github.com/rbenv/ruby-build.git /usr/local/share/ruby-build
    ln -s /usr/local/share/ruby-build /root/.rbenv/plugins/ruby-build
    ln -s /usr/local/share/ruby-build /home/${USERNAME}/.rbenv/plugins/ruby-build
fi

echo "Setting up rbenv..."
echo 'eval "$(${HOME}/.rbenv/bin/rbenv init - bash)"' >> /home/${USERNAME}/.bashrc
chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.rbenv
chmod -R 755 /home/${USERNAME}/.rbenv

#  Install ruby
#-----------------------------------------------
echo "Installing ruby..."
sudo -u ${USERNAME} -H sh -c "/home/${USERNAME}/.rbenv/bin/rbenv install ${RUBY_VERSION}"
sudo -u ${USERNAME} -H sh -c "/home/${USERNAME}/.rbenv/bin/rbenv global ${RUBY_VERSION}"

#  Setup onCreateCommand
#-----------------------------------------------
if [ ! -d "/home/${USERNAME}/.onCreateCommand" ]; then
  echo "Creating .onCreateCommand directory..."
  mkdir -p /home/${USERNAME}/.onCreateCommand
fi
cp onCreateCommand /home/${USERNAME}/.onCreateCommand/ruby

# Clean up
echo "Final clean up..."
rm -rf /var/lib/apt/lists/*

echo "Done!"
