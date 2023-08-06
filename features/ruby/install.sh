#!/bin/bash

USER_NAME="vscode"
USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
RUBY_VERSION="${VERSION}"

set -e

# Clean up
rm -rf /var/lib/apt/lists/*

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}


# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

# Install dependencies
check_packages curl ca-certificates software-properties-common build-essential gnupg2 libreadline-dev \
    procps dirmngr gawk autoconf automake bison libffi-dev libgdbm-dev libncurses5-dev \
    libsqlite3-dev libtool libyaml-dev pkg-config sqlite3 zlib1g-dev libgmp-dev libssl-dev
if ! type git > /dev/null 2>&1; then
    check_packages git
fi


# Install rbenv
if [[ ! -d "/usr/local/share/rbenv" ]]; then
    git clone --depth=1 \
        -c core.eol=lf \
        -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        https://github.com/rbenv/rbenv.git /usr/local/share/rbenv

    ln -s /usr/local/share/rbenv /root/.rbenv
fi

if [[ ! -d "/usr/local/share/ruby-build" ]]; then
    git clone --depth=1 \
        -c core.eol=lf \
        -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        https://github.com/rbenv/ruby-build.git /usr/local/share/ruby-build
    mkdir -p /root/.rbenv/plugins

    ln -s /usr/local/share/ruby-build /root/.rbenv/plugins/ruby-build
fi

mkdir -p /home/${USERNAME}/.rbenv/plugins

if [[ ! -d "/home/${USERNAME}/.rbenv/plugins/ruby-build" ]]; then
    ln -s /usr/local/share/ruby-build /home/${USERNAME}/.rbenv/plugins/ruby-build
fi

echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> /home/${USERNAME}/.bashrc
eval "$(/usr/local/share/rbenv/bin/rbenv init - bash)"
rbenv install ${RUBY_VERSION}

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
