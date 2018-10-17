# linux-setup

Tools and scripts to setup and configure a linux desktop, and to sync files with a remote location.

## Components

1. setup.run
    
    Run on first setup, and if vimrc is updated

    - Change TARGET_USER to be actual username for copying config files
    - Uncomment the lines you want to run, all lines commented by default

2. .vimrc
    
    Compatible with vim and neovim.

3. backup/sync.sh
    
    Sync files from a local directory to a remote location. Can do the following as prompted:
    - pull files from remote
    - backup files to remote