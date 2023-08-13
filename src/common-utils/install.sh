#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
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

#  Install Postgresql
#-----------------------------------------------
echo "Installing Postgresql..."
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
&& check_packages postgresql-13 \
&& service postgresql start \
&& su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\"" \
&& sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf \
&& sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf

#  Install dependencies packages
#-----------------------------------------------
echo "Installing dependency packages..."
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

#  Install development tools
#-----------------------------------------------
echo "Installing development tools..."
# for gh
type -p curl >/dev/null || check_packages curl
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& check_packages gh

check_packages tmux neovim fzf ripgrep # for others

#  Setup .bashrc
#-----------------------------------------------
echo "Setting up .bashrc..."
cp -r bash /home/${USERNAME}/bash
echo -e 'for file in /home/vscode/bash/*.bash; do\n  source "$file"\ndone' >> /home/${USERNAME}/.bashrc

cp .bash_history_template /home/${USERNAME}/.bash_history

#  Setup onCreateCommand
#-----------------------------------------------
if [ ! -d "/home/${USERNAME}/.onCreateCommand" ]; then
  echo "Creating .onCreateCommand directory..."
  mkdir -p /home/${USERNAME}/.onCreateCommand
fi
cp onCreateCommand /home/${USERNAME}/.onCreateCommand/common-utils

# Clean up
echo "Final clean up..."
rm -rf /var/lib/apt/lists/*

echo "Done!"
