# Adriel's Dotfiles Repository
This repository hosts `.files` (*dotfiles*) used for my personal development
environment workflow. The scripts in this repository, and the assumptions made
are mostly intended for MacOS; however, there are cross-platform applications
for Linux systems.

# Instructions
The following things need to be run in order. This will take a new computer
from zero -> hero. This is designed primarily for MacOS, but also works on
Linux and can "kinda" be used on Windows.

1. the [Homebrew Package Manager](https://brew.sh)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Install and Configure [Oh My ZSH](https://ohmyz.sh)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
```
3. Install and Configure [Powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
4. Run [./setup_env.sh](./setup_env.sh) to:
    - install brew bundles
    - stow the dotfiles
    > If  you get errors with stow due to files already existing, ensure that
    > you backup the hold files and then delete them to let stow replace them.
    - install vim-plug
    - install a couple lsps
5. Open NeoVim by running `nvim` or `vim` and run:
    - `:PlugInstall`

## Files in this repository
```
tree
.
├── .config
│   └── nvim
│       ├── init.vim
│       ├── lua
│       │   ├── main.lua
│       │   └── user
│       │       ├── fugitive.lua
│       │       ├── harpoon.lua
│       │       ├── keymaps.lua
│       │       ├── lsp.lua
│       │       ├── plugins.lua
│       │       ├── settings.lua
│       │       └── treesitter.lua
│       └── vscode
│           └── keybinds.vim
├── .gitignore
├── .stow-local-ignore
├── .tmux.conf
├── .zshrc
├── Brewfile
├── LICENSE.md
├── README.md
├── iterm-profile.json
└── setup_env.sh

5 directories, 19 files
```
The files in this repository are a continual work in progress. The automation listed
in this repository will do the following:
- Create a `~/.config` directory to place your NeoVim configuration.
- Install [vim-plug](https://github.com/junegunn/vim-plug)
- Install several packages using `brew bundle` against the `Brewbundle` file
- Globally install a few language servers used by NeoVIM using NPM

## VSCode (WIP)
You can use the NeoVim plugin for VSCode with this setup.
To make sure `j k h l` run on hold, you need to run the following command on MacOS.
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

You can read more about this on [VSCodium/VIM's Readme](https://github.com/VSCodeVim/Vim/blob/master/README.md#mac-setup)

## Git Configuration

Here are some helpful links around git configuration. 

* https://gist.github.com/edwhad/a25f728e6add3f6d1f7a483810e9d555
* https://developer.1password.com/docs/ssh/agent/advanced/#use-multiple-github-accounts

This is usually per-device, but I generally use 1Password to manage my SSH keys.
When different SSH keys for different instances are necessary, I usually setup a
directory structure for cloning repositories which map to my keys.


My config ends up looking something like:

```

[user]
	email = <my-email>
	name = Adriel Perkins

[includeIf "gitdir:~/path/to/some-org/"]
    path = ~/path/to/some-org/.gitconfig

```

Then my `.gitconfig` in the `some-org` directory looks like:

```
[user]
	email = <some other email>
	name = Adriel Perkins

[core]
    ; Must point to public key for the 1Pass SSH Agent to handle private.
    sshCommand = ssh -i ~/.ssh/some-org.pub

```
