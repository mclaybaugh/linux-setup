# linux-setup

Tools and scripts to setup and configure a linux desktop, and to sync files with a remote location.

## Actively used components

1. setup.run
    
    Run on first setup, and if vimrc is updated

    - Change TARGET_USER to be actual username for copying config files
    - Uncomment the lines you want to run, all lines commented by default

2. .vimrc
    
    Compatible with vim and neovim. I currently use neovim.

3. backup/sync.sh
    
    Sync files from a local directory to a remote location. Can do the following as prompted:
    - pull files from remote
    - backup files to remote

## Components that I DO NOT use

I started this when I had Arch linux installed, and then I shortly after moved to Ubuntu (18.04). Most of the unused items are from when I was on Arch linux.

1. redshift.conf

    I use the default Ubuntu Gnome option for this at the moment

2. .config/i3/config

    I use Gnome with Ubuntu.
   
3. init.el
    
    I used emacs for a bit to try it out, but I am just using neovim and vscode currently
