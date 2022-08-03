# ~/.bashrc: executed by bash(0) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################3
# my setting

# git add, commit, push まで一度に行う
gish() {
  # 全てステージに乗せる
  git add -A;
  MSG=`date "+%Y%m%d_%H-%M-%S"`
  git commit -m "${MSG}"
  CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
  git push origin ${CULLENT_BRANCH};
  # コミット対象のファイルを確認
  # git status;
  # read -p "Commit with this conent. OK? (y/N): " yesno
  # case "$yesno" in
  #     # yes
  #     [yY]*) read -p "Input Commit Message: " msg;
  #     git commit -m "$msg";
  #     CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
  #     git push origin ${CULLENT_BRANCH};;
  #     # no
  #     *) echo "Quit.";;
  # esac
}

hugog() {
  cur_dir=$(pwd)
  git_root=$(git rev-parse --show-toplevel)
  cd $git_root
  hugo --minify --cleanDestinationDir
  cd "$git_root/public"
  gish
  cd $cur_dir
}

qk() {
  ssh-agent -k
  exit
}

# linux
if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  # 英語で表示
  export LANG=en_US
  # gui 関係の設定
  # export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
  # export LIBGL_ALWAYS_INDIRECT=1
  # プロンプトの表示関係
  if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  if [ -f /etc/bash_completion.d/git-prompt ]; then
    export PS1='\[\033[01;32m\][\u@\h]\[\e[0m\] \[\033[01;33m\]\w\[\e[36m\]$(__git_ps1)\[\e[0m\]\n\\$ '
  else
    export PS1='\[\033[01;32m\][\u@\h]\[\e[0m\] \[\033[01;33m\]\w \[\e[0m\]\n\\$ '
  fi
  # # python
  # export PYENV_ROOT="$HOME/.pyenv"
  # export PATH="$PYENV_ROOT/bin:$PATH"
  # eval "$(pyenv init -)"
  # export PYTHONPATH="~/develop/scraping:$PYTHONPATH"
  # export PYTHONPATH="~/develop/scraping/src:$PYTHONPATH"
  # # poetry
  # export PATH="$HOME/.poetry/bin:$PATH"

# windows (git-bash) の設定
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
  # alias ssh='/c/Windows/System32/OpenSSH/ssh.exe'
  alias hugo3='hugo -D -p 1313 server'
  alias hugo2='hugo -D -p 1312 server'
  alias hugob='hugo --minify --cleanDestinationDir'
  alias ff="winpty ff"
  alias mduch="sh ~/.dotfiles/bin/touch_mkdir.sh"

  alias e='gvim'
  alias eb='gvim ~/.bashrc'

    # 日本語表記関係
    export LC_ALL=ja_JP.utf8
    export LANG=ja_JP.utf8
    export LANGUAGE=ja_JP.utf8
    export LC_CTYPE="ja_JP.utf8"
    export LC_NUMERIC="ja_JP.utf8"
    export LC_TIME="ja_JP.utf8"
    export LC_COLLATE="ja_JP.utf8"
    export LC_MONETARY="ja_JP.utf8"
    export LC_MESSAGES="ja_JP.utf8"

    case "$TERM" in  # 'cygwin' になる
      xterm*)
        for name in node ipython php php5 psql python2.7; do
          case "$(type -p "$name".exe 2>/dev/null)" in
            ''|/usr/bin/*) continue;;
          esac
          alias $name="winpty $name.exe"
        done
        ;;
    esac
  else
    echo "Your platform ($(uname -a)) is not supported."
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export LANGUAGE=C
export LANGUAGE=en_US

# gtk? 関係
export NO_AT_BRIDGE=1

# ranger のネスト問題
ranger() {
  if [ -z "$RANGER_LEVEL" ]; then
    /usr/bin/ranger $@
  else
    exit
  fi
}

[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '

