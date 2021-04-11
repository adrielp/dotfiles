# Adriel's Dotfiles Repository
This repository hosts my various `dot` files used to replicate configuration.

## Files in this repository
- .zshrc # my zshrc configuration 
- .vimrc # my vim configuration 
Requires vim-plug installation then `:PlugInstall`
- .tmux.conf # my basic tmux configuration file
This file may re-act differently on different OS's and different terminals.
This file here is primarily used on MacOS with configuration change needed on Linux. 
- .config/nvim/init.vim
This is my basic NeoVim configuration file and is continually a work in progress. 
Currently, I use the `.config` directory in my home to be the place where all my NeoVim configuration
lives. I'm able to use this same configuration on MacOS, Windows 10, and various Linux OSes. 
This also requires that you install [vim-plug](https://github.com/junegunn/vim-plug)
If you use the commands listed on the `vim-plug README.md` you'll have to do some editing of the `init.vim`
file to point to the correct locations.
The commands I have used to install on Linux and Windows that match my configuration are as follows:
**Linux/MacOS**
```
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
**Windows**
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "~/.config/nvim/autoload/plug.vim" -Force
```

On Windows, I use NeoVim inside of Windows Terminal. 
I install the nightly release of NeoVim via `scoop`. 
See [NeoVim Installation Docs on Github](https://github.com/neovim/neovim/wiki/Installing-Neovim)

I created a specific Terminal Profile with the following command to spawn a new terminal in the directory of my choice.
This command is set in Windows Terminal configuration.
```
wt cd C:\path\to\development\directory && nvim -u C:\path\to\my\init.vim\because\it's\not\the\default\location .
```

Additionally, I make sure to install Language Server Protocols through `npm`
Example:
```
npm i -g pyright
```

