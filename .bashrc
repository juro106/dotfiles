alias ls='ls -F --color=auto --show-control-chars' 
alias ll='ls -l' 
alias la='ls -a --show-control-chars'

alias sb='source ~/.bashrc'
alias q='exit'

alias today='date +%Y-%m-%d'
alias touchtoday='e `date +%Y-%m-%d`.md'

alias addlil="ssh-add ~/.ssh/id_rsa_lil"
alias addkoke="ssh-add ~/.ssh/id_rsa_koke"

# linux
if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # gui 関係の設定
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
    export LIBGL_ALWAYS_INDIRECT=1
    # プロンプトの表示関係
   if [ -f /etc/bash_completion ]; then
           . /etc/bash_completion
   fi
   if [ -f /etc/bash_completion.d/git-prompt ]; then
           export PS1='\[\033[01;32m\][\u@\h]\[\e[0m\] \[\033[01;33m\]\w\[\e[36m\]$(__git_ps1)\[\e[0m\]\n\\$ '
       else
           export PS1='\[\033[01;32m\][\u@\h]\[\e[0m\] \[\033[01;33m\]\w \[\e[0m\]\n\\$ '
   fi

    # ruby
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.rbenv/varsions/2.7.1/bin:$PATH"
    eval "$(rbenv init -)"
    # ruby 2.7.1 と rails 5.1.3 でマイグレーションすると出る警告を抑える
    # バージョンアップで改善されたら消す
    export RUBYOPT='-W:no-deprecated -W:no-experimental'

# windows (git-bash) の設定
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    # alias ssh='/c/Windows/System32/OpenSSH/ssh.exe'
    alias hugo3='hugo -D -p 1313 server'
    alias hugo2='hugo -D -p 1312 server'
    alias hugob='hugo --minify --cleanDestinationDir'
    alias ff="winpty ff"
    alias mduch="sh ~/.dotfiles/bin/touch_mkdir.sh"

    alias gvim='/c/vim/gvim.exe'
    alias e='gvim'
    alias eb='gvim ~/.bashrc'

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
        hugo --minify --cleanDestinationDir;
        cd public;
        gish;
        cd ..
    }

    qk() {
        ssh-agent -k
        exit
    }
else
    echo "Your platform ($(uname -a)) is not supported."
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
