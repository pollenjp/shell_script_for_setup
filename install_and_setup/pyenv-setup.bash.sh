#!/bin/bash -eux

# prerequisites
# https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites
sudo apt-get install -y \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl

# 1. Check out Pyenv where you want it installed
PYENV_ROOT=${HOME}/.pyenv
if [ ! -d "${PYENV_ROOT}" ]; then
  git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT}
fi

# 2. Configure your shell's environment for Pyenv

# i. Adjust the session-wide environment for your account
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile

# ii. Add pyenv into your shell by running the output of pyenv init - to enable autocompletion and all subcommands.
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

printf 'You should run below command!\n\033[36m %s \033[0m\n' 'exec "$SHELL"'

####################
# pyenv-virtualenv #
####################

DIR_PATH=${PYENV_ROOT}/plugins/pyenv-virtualenv
if [ ! -d "${DIR_PATH}" ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git ${DIR_PATH}
fi

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
