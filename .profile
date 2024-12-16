# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash 
# 2022-07-17
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 	. "$HOME/.bashrc"
#     fi
# fi

# Locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=C
export MANLANG=ja
export DISPLAY=:0.0
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

# gui 関係の設定
# export LIBGL_ALWAYS_INDIRECT=1

# Environment for GUI and GTk
# AT-SPI: Assistive Technology Service Provider Interface の略で、アクセシビリティ（視覚障害や身体障害を持つユーザーのための支援技術）を提供するためのインターフェイスです。
# 例えば、スクリーンリーダー（画面読み上げソフト）が GUI アプリケーションの状態を取得するために使用します。
export NO_AT_BRIDGE=1

# User-specific PATH additions
USER_BIN_PATHS=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "/usr/local/go/bin"           # Go language
    "$HOME/go/bin"                # Go binaries
    "/opt/nvim-linux64/bin"       # Neovim
    "$HOME/.deno/bin"             # Deno
    "$HOME/.tfenv/bin"            # Terraform
)
for path in "${USER_BIN_PATHS[@]}"; do
    [[ -d "$path" && ":$PATH:" != *":$path:"* ]] && PATH="$path:$PATH"
done

# Export final PATH
export PATH

# Load Rust environment
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Load GHCup (Haskell) environment
if [ -f "$HOME/.ghcup/env" ]; then
    . "$HOME/.ghcup/env"
fi

# Load NVM (Node Version Manager) environment
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# Load SDKMAN (Java version manager) environment
if [ -d "$HOME/.sdkman" ]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    [ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && . "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
