#! /usr/bin/env zsh

# exit immediately on failure
set -eo pipefail

# Setting variables for decisions, getopts will override these.
all=1
brew=0
stow=0
nvim=0
lsp=0

die() {
    printf '%s\n' "$1" >&2
    exit 1
}

show_help() {
    echo "This script takes in the following values:"
    echo "[-h|--help] - Displays this help message."
    echo "[-b|--brew] - Runs brew bundle."
    echo "[-s|--stow] - Runs stow against the dotfiles."
    echo "[-n|--nvim] - Runs install of NVIM plugins."
    echo "[-l|--lsp] - Runs install of LSPs."
}

brew_install() {
    if [ -f "Brewfile" ]
    then
        echo "Installing brew dependencies..."
        brew bundle --force
    else
        echo "Brewfile does not exist, skipping dependency installs..."
    fi
}

stow_files() {
    if (! command -v stow) && [[ $stow == 1 || $all = 1 ]]
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
}

nvim_setup() {
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
}

lsp_install() {
    # Install NPM LSPs
    npm install -g pyright
    npm install -g bash-language-server

    # Install gopls
    go install golang.org/x/tools/gopls@latest
}

while :; do
    case $1 in
        -h|-\?|--help)
            show_help    # Display a usage synopsis.
            all=0
            exit
            ;;
        -b|--brew)
            brew=1
            all=0
            ;;
        -s|--stow)
            stow=1
            all=0
            ;;
        -n|--nvim)
            nvim=1
            all=0
            ;;
        -l|--lsp)
            lsp=1
            all=0
            ;;
        --)              # End of all options.
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)               # Default case: No more options, so break out of the loop.
            break
    esac
    shift
done

if [ $brew = 1 ] || [ $all = 1 ]
then
    brew_install
fi

if [ $stow = 1 ] || [ $all = 1 ]
then
    stow_files
fi

if [ $nvim = 1 ] || [ $all = 1 ]
then
    nvim_setup
fi

if [ $lsp = 1 ] || [ $all = 1 ]
then
    lsp_install
fi
