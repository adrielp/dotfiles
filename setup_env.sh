#! /usr/bin/env zsh

# exit immediately on failure
set -eo pipefail

# Setting variables for decisions, getopts will override these.
all=1
brew=0
stow=0
unstow=0
nvim=0
package=0

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
    echo "[-p|--package] - Runs install of other packages."
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
        if [[ (! -L "$HOME/.zsrhc") && (-f "$HOME/.zshrc") ]]
        then
            echo "Backing up original .zshrc"
            mv $HOME/.zshrc $HOME/.zshrc.bak
        fi
        echo "Stowing directory"
        stow . --restow --target=$HOME
    fi
}

unstow_files() {
    if (command -v stow)
    then
        echo "Unstowing files."
        stow -D .
    else
        echo "The Stow command doesn't exist."
        exit 1
    fi
}

nvim_setup() {
    if [ -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"]
    then
        echo "Packer already installed, skipping installation..."
    else 
        echo "Installing Packer..."
        git clone --depth 1 https://github.com/wbthomason/packer.nvim \
            ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    fi
    #if [ -f "$HOME/.config/nvim/autoload/plug.vim" ]
    #then
    #    echo "VimPlug already installed. Skipping VimPlug Installation..."
    #else
    #    echo "Installing VimPlug"
    #    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    #           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    #fi

    # Install Plugins
    #nvim -c 'PlugInstall --sync' +qall
    #nvim -c 'PlugUpdate --sync' +qall
    #nvim -c 'TSUpdate' +qall

    # nvim coq command if running coq
    #nvim -c 'COQdeps' +qall
}

package_install() {
    # Install NPM LSPs
    npm install -g pyright
    npm install -g bash-language-server
    npm install -g vscode-langservers-extracted
    npm install -g typescript typescript-language-server

    # Install Yarn LSPs
    yarn global add yaml-language-server


    # Install other NPM packages
    npm install -g semantic-release

    # Install Go packages
    go install golang.org/x/tools/gopls@latest
    go install github.com/securego/gosec/v2/cmd/gosec@latest
    go install honnef.co/go/tools/cmd/staticcheck@latest
    go install golang.org/x/tools/cmd/goimports@latest
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
        -u|--unstow)
            unstow=1
            all=0
            ;;
        -n|--nvim)
            nvim=1
            all=0
            ;;
        -p|--package)
            package=1
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

if [ $unstow = 1 ]
then
    unstow_files
fi

if [ $stow = 1 ] || [ $all = 1 ]
then
    stow_files
fi

if [ $nvim = 1 ] || [ $all = 1 ]
then
    nvim_setup
fi

if [ $package = 1 ] || [ $all = 1 ]
then
    package_install
fi
