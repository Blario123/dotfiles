export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

ENABLE_CORRECTION="true"

plugins=(git \
         zsh-autosuggestions \
         dirhistory \
         bgnotify \
         command-not-found \
         sudo \
)

source $ZSH/oh-my-zsh.sh

prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "SSH_CLIENT" ]]; then
		prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
	fi
}

apt() {
	command nala "$@"
}

sudo() {
	if [ "$1" = "apt" ]; then
		shift
		command sudo nala "$@"
	else
		command sudo "$@"
	fi
}

alias gs="git status"
alias cls="clear"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export CPLUS_INCLUDE_PATH=/usr/include/c++/
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH=$PATH:/home/blair/.spicetify
export PATH=$PATH:/opt/wine-staging/bin
export PATH=$PATH:/opt/llvm-project/build/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
