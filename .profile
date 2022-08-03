# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export DISPLAY=:0.0

export LC_ALL=en_US.UTF-8
export LANG=ja_JP.UTF-8
. "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH:~/bin:~/bin/py:~/bin/bash:~/.deno/bin"

#
# # /dev/null 2>&1
# # `>` is Redirect
#
# # Common
# # ssh-agent
# # ssh-add $HOME/.ssh/id_rsa_github
#
# SSH_AGENT_FILE=$HOME/.ssh-agent
# test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
# if ! ssh-add -l > /dev/null 2>&1; then
#     ssh-agent > $SSH_AGENT_FILE
#     source $SSH_AGENT_FILE
#     ssh-add $HOME/.ssh/id_rsa_github
# fi
#
# CURRENT_DIR=$(pwd)
# if [ "`echo $CURRENT_DIR | grep '/hugo/shingeki'`" ]; then
#     sshList=`ssh-add -L`
#     pub1=`cat $HOME/.ssh/id_rsa_lil.pub`
#     if ! [ "`echo "${pub1}" | grep "${sshList}"`" ]; then
#         ssh-add $HOME/.ssh/id_rsa_lil
#     fi
# fi
#
# # windows (git-bash) 
# if [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
#     CURRENT_DIR=$(pwd)
#     if [ "`echo $CURRENT_DIR | grep '/hugo/shingeki'`" ]; then
#         sshList=`ssh-add -L`
#         pub1=`cat $HOME/.ssh/id_rsa_lil.pub`
#         if ! [ "`echo "${pub1}" | grep "${sshList}"`" ]; then
#             ssh-add $HOME/.ssh/id_rsa_lil
#         fi
#     # elif [ "`echo $CURRENT_DIR | grep '/hugo/sasasa'`" ]; then
#     #     sshList=`ssh-add -L`
#     #     pub2=`cat $HOME/.ssh/id_rsa_koke.pub`
#     #     if ! [ "`echo "${pub2}" | grep "${sshList}"`" ]; then
#     #         ssh-add $HOME/.ssh/id_rsa_koke
#     #     fi
#     fi
#     # exports
#     export MSYS=winsymlinks:nativestrict
# fi
