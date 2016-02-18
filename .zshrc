export LANG=ja_JP.UTF-8

bindkey -e

alias ls='ls --color=auto'
alias vi='vim'
alias grep='grep --color'
alias tmux='tmux -2'

setopt append_history
setopt auto_list
setopt list_packed
setopt auto_menu
setopt no_beep
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt magic_equal_subst
setopt share_history

PROMPT='%{[32m%}%B%n@%m%#%{[m%}%b '
#RPROMPT='%{[32m%}%B[%d]%{[m%}%b'
RPROMPT=''
SPROMPT='%{[33m%} %BCurrenct> '\''%r'\'' [Yes, No, Abort, Edit]%{[m%}%b '

export EDITOR=vim

# for peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER" --prompt "peco> " )
  if [ -n "$selected_dir" ]; then
    BUFFER="cd \"${selected_dir}\""
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco --prompt "..  竍ｨ")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^[' peco-cdr

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER" --prompt "..  ⇨" --layout=bottom-up)
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
