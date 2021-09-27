if [[ $TERM == xterm-256color || $TERM == st-256color ]]; then
    exec tmux
fi 

export EDITOR=vim
alias vi="vim"
alias m="make"
alias mc="make clean"

#10 sec wait before rm*
setopt RM_STAR_WAIT
#ignore history duplicates
setopt HIST_IGNORE_DUPS
#disable C-s
setopt noflowcontrol
#detaching jobs
setopt NO_HUP
setopt NO_CHECK_JOBS

#make completion settings usable
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' completer _complete
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.cache/zsh
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

autoload -Uz compinit
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

#changes $ to red when in normal mode
zle-line-init zle-keymap-select(){
case ${KEYMAP} in
    (vicmd)      PROMPT=$'%{\e[0;32m%}%~%{\e[0m%} %{\e[0;31m%}$%{\e[0m%} ' ;;
    (main|viins) PROMPT=$'%{\e[0;32m%}%~%{\e[0m%} $ ' ;;
    (*)          PROMPT=$'%{\e[0;32m%}%~%{\e[0m%} $ ' ;;
esac
zle reset-prompt
}

#C-h goes home and clears
clr(){
    cd ~
    zle clear-screen
}

#register functions as zle widgets
zle -N zle-line-init
zle -N zle-keymap-select
zle -N clr

#custom key bindings
#vi mode
bindkey -v
# 10ms for key sequences
KEYTIMEOUT=1
bindkey '^w' backward-kill-word
#use the vi navigation keys in menu completion
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
#line clearing
bindkey \^H clr
bindkey \^U kill-whole-line
bindkey -a \^U vi-change-whole-line
#why isn't this default
bindkey "^?" backward-delete-char
bindkey '^[[3~' delete-char
#extra vim functionality
bindkey -a 'dd' vi-change-whole-line

#misc functions
#cd does ls when not home
cd(){
    builtin cd "$@"
    if [[ $PWD != "$HOME" ]]; then
        ls --color=auto
    fi
}
