#!/bin/bash

set -e

USER_NAME=vscode
su $USER_NAME <<EOF
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> $HOME/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$($HOME/.rbenv/bin/rbenv root)"/plugins/ruby-build
$HOME/.rbenv/bin/rbenv install 3.1.4
$HOME/.rbenv/bin/rbenv global 3.1.4

echo "done!"
EOF


echo "done"