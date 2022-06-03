# ==> ZSH
export ZSH="/home/orion/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(rust git)

source $ZSH/oh-my-zsh.sh

eval $(starship init zsh)

# ==> PATH / Environment
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:/home/linuxbrew/.linuxbrew/bin:$HOME/.cargo/bin
export SSLKEYLOGFILE="$HOME/.ssl-key.log"
export GPG_TTY=$(tty)
export ANDROID_HOME=$HOME/Android/Sdk/
export JAVA_HOME=$HOME/src/aur/android-studio/src/android-studio/jre/
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export EDITOR='kak'

alias sudo=doas

## asdf
. /opt/asdf-vm/asdf.sh

## opam
[[ ! -r /home/orion/.opam/opam-init/init.zsh ]] || source /home/orion/.opam/opam-init/init.zsh

# ==> Helpers
## monitors
mon() {
  xrandr --output eDP --mode 1920x1200
}

mon_work() {
  xrandr --output eDP --mode 1920x1200 \
         --output DisplayPort-2 --mode 2560x1440 --left-of eDP
}

mon_home() {
  xrandr --output eDP --mode 1920x1200 \
         --output DisplayPort-1 --mode 2560x1440 --left-of eDP
}

# ==> Shell Utils
## Autojump
source /etc/profile.d/autojump.zsh

## fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

eval $(thefuck --alias)
alias cg='cargo'
alias cgn='cargo +nightly'

wal -Rq

## Qwick
alias brokedb="sudo chown -R $USER db-data* || echo && yarn stop && yarn db:clean && yarn db:refresh:fast && yarn start:fast && yarn migrate:local && yarn get-schema"
