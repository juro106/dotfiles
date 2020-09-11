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

# exports
export MSYS=winsymlinks:nativestrict
export PS1="\w $ "
