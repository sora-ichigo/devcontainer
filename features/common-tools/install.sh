#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*!/bin/bash

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*SERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*et -e

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Clean up
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*m -rf /var/lib/apt/lists/*

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*pt_get_update()
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*       echo "Running apt-get update..."
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*       apt-get update -y
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   fi
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Checks if packages are installed and installs them if not
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*heck_packages() {
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   if ! dpkg -s "$@" > /dev/null 2>&1; then
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*       apt_get_update
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*       apt-get -y install --no-install-recommends "$@"
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   fi
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*reate_psql_user() {
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   service postgresql start
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Install postgresql-13
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*cho "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*get --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*heck_packages postgresql-13
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*reate_psql_user

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Install dependencies (dependencies for development)
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*heck_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*   git-core bash-completion

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Install dependencies (development tools)
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*heck_packages tmux neovim fzf ripgrep

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Install git completion
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*get https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O /home/${USERNAME}/.git-completion.bash
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*hown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.git-completion.bash
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*hmod -R 755 /home/${USERNAME}/.git-completion.bash

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*kdir /home${USERNAME}/bash
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*p -r bash /home/${USERNAME}/bash
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*p .bash_history_template /home/${USERNAME}/.bash_history
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*cho 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/* Clean up
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*m -rf /var/lib/apt/lists/*
#!/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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

create_psql_user() {
    service postgresql start
    su postgres -c "psql --command \"CREATE ROLE vscode LOGIN SUPERUSER\""
    sed -i 's/md5/trust/g'  /etc/postgresql/13/main/pg_hba.conf
    sed -i 's/peer/trust/g'  /etc/postgresql/13/main/pg_hba.conf
}

# Install postgresql-13
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
check_packages postgresql-13
create_psql_user

# Install dependencies (dependencies for development)
check_packages libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    libnss3-dev iptables libx11-dev libxtst6 sshfs libncurses5-dev libncursesw5-dev libpq-dev \
    git-core bash-completion

# Install dependencies (development tools)
check_packages tmux neovim fzf ripgrep

mkdir /home${USERNAME}/bash
cp -r bash /home/${USERNAME}/bash
cp .bash_history_template /home/${USERNAME}/.bash_history
echo 'souce $HOME/bash/*' >> /home/${USERNAME}/.bashrc

# Clean up
rm -rf /var/lib/apt/lists/*
