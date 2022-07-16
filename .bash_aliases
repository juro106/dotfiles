# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lf='ls -CF'

alias ls='ls -F --color=auto --show-control-chars' 
# alias ll='ls -l' 
alias la='ls -a --show-control-chars'

alias sb='source ~/.bashrc'
alias q='exit'

alias today='date +%Y-%m-%d'
alias touchtoday='e `date +%Y-%m-%d`.md'

alias vimg="vim -g"
alias e="vim"
alias v="vim"

alias addlil="ssh-add ~/.ssh/id_rsa_lil"
alias addkoke="ssh-add ~/.ssh/id_rsa_koke"

alias ter="xfce4-terminal"

alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'

alias goo='searchByGoogle'
function searchByGoogle() {
    # 第一引数がない場合はpbpasteの中身を検索単語とする
    [ -z "$1" ] && searchWord=`pbpaste` || searchWord=$1
    xdg-open https://www.google.co.jp/search\?q\=$searchWord
}

alias mozc-tool="env LANGUAGE=ja:en /usr/lib/mozc/mozc_tool --mode=config_dialog"
alias mozc-dict="/usr/lib/mozc/mozc_tool --mode=dictionary_tool"
alias mozc-word="/usr/lib/mozc/mozc_tool --mode=word_register_dialog"


# hugo用
alias hugo3='hugo -D -p 1313 server'
alias hugo2='hugo -D -p 1312 server'
alias hugob='hugo --minify --cleanDestinationDir'
