#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
RUBY_VERSION=${VERSION}

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

# postgresqlのインストール
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
&& check_packages postgresql-13 \
&& service postgresql start \
&& su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\"" \
&& sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf \
&& sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf

# パッケージのインストール (依存)
apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# パッケージのインストール (ツール)
apt-get update && export DEBIAN_FRONTEND=noninteractive \
&& apt-get -y install --no-install-recommends \
    tmux neovim fzf ripgrep

cp .bash_history_template /home/${USERNAME}/.bash_history
cp -r bash /home/${USERNAME}/bash
echo -e 'for file in /home/vscode/bash/*.bash; do\n  source "$file"\ndone' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*
