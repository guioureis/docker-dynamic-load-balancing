#!/usr/bin/env bash

set -e
set -o pipefail

HOME_DIR=/home/vagrant

if [[ ! -d $HOME_DIR/.oh-my-zsh ]];
then
    # Clone Oh My Zsh from the git repo
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME_DIR/.oh-my-zsh

    # Copy in the default .zshrc config file
    cp $HOME_DIR/.oh-my-zsh/templates/zshrc.zsh-template $HOME_DIR/.zshrc_temp

    cat $HOME_DIR/.zshrc >> $HOME_DIR/.zshrc_temp 

    # Copy our config into .zshrc_temp config file
    mv -f $HOME_DIR/.zshrc_temp $HOME_DIR/.zshrc

    echo "export LC_ALL=en_US.UTF-8" >> $HOME_DIR/.zshrc
    echo "export LANG=en_US.UTF-8" >> $HOME_DIR/.zshrc

    # Change the vagrant user's shell to use zsh
    chsh -s /bin/zsh vagrant
fi
