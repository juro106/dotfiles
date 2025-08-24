# git
alias g='git'
alias ga='~/bin/bash/gitadd.sh'
alias gc='~/bin/bash/gitcommit.sh'
alias gpu='~/bin/bash/gitpush.sh'

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

alias vi="vi -u NONE"
alias vimg="vim -g"
alias v="vim"
alias v0="vim -u ~/vimrc0"
alias e="nvim"

alias sshaddlil="ssh-add ~/.ssh/id_ed25519_lil"
alias sshaddgithub="ssh-add ~/.ssh/id_rsa_github"
alias sshaddgithubsub="ssh-add ~/.ssh/id_ed25519"

alias ter="xfce4-terminal"

alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'

alias mozc-tool="env LANGUAGE=ja:en /usr/lib/mozc/mozc_tool --mode=config_dialog"
alias mozc-dict="/usr/lib/mozc/mozc_tool --mode=dictionary_tool"
alias mozc-word="/usr/lib/mozc/mozc_tool --mode=word_register_dialog"

# hugo用
alias hugog='bash hugo_build_deploy.sh'
alias hugo4='hugo server -D -p 1314'
alias hugo3='hugo server -D -p 1313'
alias hugo2='hugo server -D -p 1312 HUGO_BASEURL=http://localhost:1312/'
# alias hugo2='hugo server -D -p 1312 --baseURL http://localhost:1312/'
alias hugoc='hugo --cleanDestinationDir'
alias hugomc='hugo --minify --cleanDestinationDir'

# goolge search script
alias ggl='google_search'

# incremental search
alias incr=search.sh

# terraform
alias tf="terraform"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias tff="terraform fmt -recursive"
alias tfa="terraform apply -auto-approve"
alias tfd="terraform destroy -auto-approve"

# man japanese
alias manj="man -L ja"

# cd
alias cdm='cd ~/dev/website/mykeiba'
