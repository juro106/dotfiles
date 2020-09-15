function to_win_path() {
  path=${*}
  echo "$(readlink -f ${path} | sed -e 's@/@\\@g' -e 's@\\c\\@c:\\@g' | tr '\n' ' ')"
}

function tree() {
    dst="$(to_win_path ${1:-$(pwd)})"
    cmd //c "chcp 437 & tree ${dst}" //a //f
}

# alias tree='cmd//c "chcp 437 & tree" //A //f'

alias ls='ls -F --color=auto --show-control-chars' 
alias ll='ls -l' 
alias la='ls -a --show-control-chars'

alias hugo3='hugo -D -p 1313 server'
alias hugo2='hugo -D -p 1312 server'
alias hugob='hugo --minify --cleanDestinationDir'
alias ff="winpty ff"
alias mduch="sh ~/dotfiles/lib/touch_mkdir.sh"

alias sb='source ~/.bashrc'

alias e='gvim'
alias eb='gvim ~/.bashrc'
alias q='exit'

alias today='date +%Y-%m-%d'
alias touchtoday='e `date +%Y-%m-%d`.md'

alias addlil="ssh-add ~/.ssh/id_rsa_lil"
alias addkoke="ssh-add ~/.ssh/id_rsa_koke"

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
