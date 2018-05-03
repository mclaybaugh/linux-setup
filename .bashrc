#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Michael Claybaugh's stuff below here
export LFS=/mnt/lfs
alias timeout='xset dpms 3600 3600 3600'
alias wp-ssh='ssh root@206.189.69.88'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'

#testing which scripts are run
echo ' '
echo '     Welcome michael - /home/michael/.bashrc'
echo "     $(date)"
echo ' '
echo "     alias ls='ls --color=auto'"
echo "     export LFS=/mnt/lfs"
echo "     alias timeout='xset dpms 3600 3600 3600'"
echo "     alias wp-ssh='ssh root@206.189.69.88'"
echo "     alias ll='ls -la --color=auto'"
echo "     alias la='ls -a --color=auto'"
echo ' '
