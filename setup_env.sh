#! /usr/bin/env zsh

# exit immediately on failure
set -exo pipefail

# check if brewfile exists and then run brew bundle
if [ -f "Brewfile" ]
then
    echo "Installing brew dependencies..."
    brew bundle --force
else
    echo "Brewfile does not exist, skipping dependency installs..."
fi

# check if the stow command exists and if so run stow
if ! command -v stow
then
    echo "Stow does not exist, exiting..."
    exit 1
else
    # backup the previous .zshrc file incase it exists but isn't a symlinked file
    # - pertinent on brand new setups
    if ! [ -L "$HOME/.zshrc" ]
    then
        echo "Backing up original .zshrc"
        mv $HOME/.zshrc $HOME/.zshrc.bak
    fi
    echo "Stowing directory"
    stow . --restow --target=$HOME
fi

# Check if vimplug is installed, if not install it
if [ -f "$HOME/.config/nvim/autoload/plug.vim" ]
then
    echo "VimPlug already installed. Skipping VimPlug Installation..."
else
    echo "Installing VimPlug"
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Plugins
nvim -c 'PlugInstall --sync' +qall
nvim -c 'PlugUpdate --sync' +qall

# Install NPM LSPs
npm install -g pyright
npm install -g bash-language-server

# Install gopls
go install golang.org/x/tools/gopls@latest
