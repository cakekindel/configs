# ==> ZSH
export ZSH="/home/orion/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(rust git)

source $ZSH/oh-my-zsh.sh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

eval $(starship init zsh)
eval $(atlas completion zsh)

source /home/orion/.secrets

# ==> PATH / Environment
export PATH=$HOME/bin:$HOME/.bun/bin:$HOME/.local/bin:/usr/local/bin:$PATH:/home/linuxbrew/.linuxbrew/bin:$HOME/.cargo/bin
export SSLKEYLOGFILE="$HOME/.ssl-key.log"
export GPG_TTY=$(tty)
export ANDROID_HOME=$HOME/Android/Sdk/
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export EDITOR='kak'
source ~/.asdf/plugins/java/set-java-home.zsh

alias sudo=doas
alias tar=bsdtar

## gcloud
source /usr/share/aur/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.zsh.inc

## asdf
. /opt/asdf-vm/asdf.sh

## opam
[[ ! -r /home/orion/.opam/opam-init/init.zsh ]] || source /home/orion/.opam/opam-init/init.zsh

# ==> Shell Utils
## Autojump
[[ -s /home/orion/.autojump/etc/profile.d/autojump.sh ]] && source /home/orion/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

## fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

eval $(thefuck --alias)
alias cg='cargo'
alias cgn='cargo +nightly'

(wal -R &>/dev/null &)

## Qwick
alias brokedb="sudo chown -R $USER db-data* || echo && yarn stop && yarn db:clean && yarn db:refresh && yarn start:fast && yarn migrate:local && yarn get-schema && sudo chmod 777 -R db-data*"
alias resetdb=brokedb
alias scorched_earth=brokedb

[ -s "/home/orion/.bun/_bun" ] && source "/home/orion/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
