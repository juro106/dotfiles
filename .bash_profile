# .bash_profile

##################################################
# my settings
##################################################

# ssh-agentを既に起動しているか確認
if [ -z "$SSH_AUTH_SOCK" ]; then
  SSH_AGENT_FILE=~/.ssh-agent
  # .ssh-agentファイルがあればそれを読み込む
  if [ -f "$SSH_AGENT_FILE" ]; then
    . "$SSH_AGENT_FILE"
  fi
  # ssh-agentが起動していなければ、起動してその情報を保存
  if ! ssh-add -l > /dev/null 2>&1; then
    ssh-agent > "$SSH_AGENT_FILE"
    . "$SSH_AGENT_FILE"
    ssh-add "$HOME/.ssh/id_rsa_github"  # 必要な鍵を追加
  fi
fi

CURRENT_DIR=$(pwd)
if [ "$(echo "$CURRENT_DIR" | grep '/hugo/shingeki')" ]; then
 sshList=$(ssh-add -L)
 pub1=$(cat "$HOME"/.ssh/id_rsa_lil.pub)
 if ! [ "$(echo "${pub1}" | grep "${sshList}")" ]; then
   ssh-add "$HOME"/.ssh/id_rsa_lil
 fi
fi

# if [ "`echo $CURRENT_DIR | grep '/hugo/sasasa'`" ]; then
#  sshList=$(ssh-add -L)
#  pub2=$(cat "$HOME"/.ssh/id_rsa_koke.pub)
#  if ! [ "$(echo "${pub2}" | grep "${sshList}")" ]; then
#    ssh-add "$HOME"/.ssh/id_rsa_koke
#  fi
# fi

if [ -f ~/.profile ]; then
  . ~/.profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
