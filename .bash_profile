# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# ssh-agent
SSH_AGENT_FILE=$HOME/.ssh-agent
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
if ! ssh-add -l > /dev/null 2>&1; then
    ssh-agent > $SSH_AGENT_FILE
    source $SSH_AGENT_FILE
    ssh-add $HOME/.ssh/id_rsa_github
fi


# windows (git-bash) の設定
if [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    CURRENT_DIR=$(pwd)
    if [ "`echo $CURRENT_DIR | grep '/hugo/shingeki'`" ]; then
        ssh-add $HOME/.ssh/id_rsa_lil
    elif [ "`echo $CURRENT_DIR | grep '/hugo/sasasa'`" ]; then
        ssh-add $HOME/.ssh/id_rsa_koke
    fi
    # exports
    export MSYS=winsymlinks:nativestrict
fi

