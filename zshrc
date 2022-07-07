defaults write com.apple.finder AppleShowAllFiles -boolean true;

bindkey "^R" history-incremental-search-backward
# up and down arrows to search 
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

# git completion
# https://stackoverflow.com/a/58517668
autoload -Uz compinit && compinit


export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

git config --global color.ui true
alias gitlg="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)' -$(expr $(tput lines) - 8)"
alias gitlga="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"

alias s="git status -s"


# just some nice helpers
alias ls='ls -F'
alias ll='ls -l -h'
alias la='ls -a'
# get the total size of all dirs
alias lss='du -sh *'


parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n@%M ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '