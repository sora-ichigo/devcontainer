#!/bin/bash

set -e

USER_NAME="vscode"

echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
&& apt-get update \
&& apt-get -y install postgresql-13 \
&& service postgresql start \
&& su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\"" \
&& sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf \
&& sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf

# パッケージのインストール (依存)
apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev

# パッケージのインストール (ツール)
apt-get update && export DEBIAN_FRONTEND=noninteractive \
&& apt-get -y install --no-install-recommends \
    tmux neovim fzf ripgrep

# ユーザーを変更してコマンドを実行
su $USER_NAME <<EOF
mkdir -p \$HOME/bash
cp bash/alias.bash \$HOME/bash/alias.bash
echo 'source \$HOME/bash/alias.bash' >> \$HOME/.bashrc
cp bash/functions.bash \$HOME/bash/functions.bash
echo 'source \$HOME/bash/functions.bash' >> \$HOME/.bashrc
cp bash/.bash_history \$HOME/.bash_history
cp bash/prompt.bash \$HOME/bash/prompt.bash
echo 'source \$HOME/bash/prompt.bash' >> \$HOME/.bashrc
EOF

# Clean up
rm -rf /var/lib/apt/lists/*
