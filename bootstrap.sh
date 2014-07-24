#!/bin/bash
# Loosly based on http://il.luminat.us/blog/2014/04/19/how-i-fully-automated-os-x-with-ansible/

set -e

SRC_DIR="$HOME/local/bin"
ANSIBLE_DIR="$SRC_DIR/ansible"
ANSIBLE_CONFIG_DIR="$HOME/.ansible.d"

# Command line tools
if [[ ! -x /usr/bin/gcc ]]; then
    echo "Info   | Install   | xcode"
    xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Modify the PATH
echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile

# Download and install zsh
if [[ ! -x /usr/local/bin/zsh ]]; then
    echo "Info   | Install   | zsh"
    brew install zsh
fi

# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
    echo "Info   | Install   | git"
    brew install git
fi

# Download and install python
if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
fi

# Download and install hg
if [[ ! -x /usr/local/bin/hg ]]; then
    pip install mercurial
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    brew install ansible
fi


# Make the code directory
mkdir -p $SRC_DIR

# Clone down the Ansible repo
#if [[ ! -d $ANSIBLE_CONFIG_DIR ]]; then
    #git clone git@github.org:geedew/ansible-base-box.git $ANSIBLE_CONFIG_DIR
#fi

#ansible-playbook --ask-sudo-pass -i $ANSIBLE_CONFIG_DIR/local/osx $ANSIBLE_CONFIG_DIR/box.yml --connection=local
