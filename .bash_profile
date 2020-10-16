# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# /dev/null 2>&1
# `>` はリダイレクト

if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # ssh-agent
    SSH_AGENT_FILE=$HOME/.ssh-agent
    test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
    if ! ssh-add -l > /dev/null 2>&1; then
        ssh-agent > $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
        ssh-add $HOME/.ssh/id_rsa_github
    fi
# windows (git-bash) の設定
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    # ssh-agent
    SSH_AGENT_FILE=$HOME/.ssh-agent
    test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
    if ! ssh-add -l > /dev/null 2>&1; then
        ssh-agent > $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
        ssh-add C:\\Users\\kenichiro\\.ssh\\id_rsa_github
    fi
    CURRENT_DIR=$(pwd)
    if [ "`echo $CURRENT_DIR | grep '/hugo/shingeki'`" ]; then
        sshList=`ssh-add -L`
        pub1=`cat $HOME/.ssh/id_rsa_lil.pub`
        if ! [ "`echo "${pub1}" | grep "${sshList}"`" ]; then
            ssh-add $HOME/.ssh/id_rsa_lil
        fi
    elif [ "`echo $CURRENT_DIR | grep '/hugo/sasasa'`" ]; then
        sshList=`ssh-add -L`
        pub2=`cat $HOME/.ssh/id_rsa_koke.pub`
        if ! [ "`echo "${pub2}" | grep "${sshList}"`" ]; then
            ssh-add $HOME/.ssh/id_rsa_koke
        fi
    fi
    # exports
    export MSYS=winsymlinks:nativestrict
fi

