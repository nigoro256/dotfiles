autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

# These names are case insensitive and underscores are ignored.
# For example, ‘allexport’ is equivalent to ‘A__lleXP_ort’.
setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS

bindkey \^U backward-kill-line
bindkey '^[[3~' delete-char

# export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

# eval "$(direnv hook zsh)"
# eval "$(rbenv init -)"
# eval "$(nodenv init - zsh)"

alias ..2='cd ../..'
alias ..3='cd ../../..'
alias l='ls -G'
alias ll='ls -GFl'
alias la='ls -GFA'
alias g='git'
alias o='open'
alias x='exit'
alias h='history'
alias catmp='security cms -D -i'
alias ss2="ssh -o 'UseKeychain yes'"
alias .clean="dot_clean .; fd -uu -F '.DS_Store' -X rm {}"
alias rmed='fd -t d -t e -X rm -vd {}'
alias p='podman'
alias px='podman exec'
alias pc='podman compose'

#hash -d alias=/path/to/directory

# prompt
#   FG, BG, RESET = ^[
#     Ctrl-v -> ESC
#     `echo -n ^[ | pbcopy`
#   see: http://blog.aqutras.com/entry/2016/07/11/210000
function zsh-left-prompt {
  # sharp='\uE0B0'
  sharp=''
  FG='%{[38;5;'
  BG='%{[30;48;5;'
  RESET='%{[0m%}'

  L1_F='178m%}'
  L1_B='237m%}'
  L1="${BG}${L1_B}${FG}${L1_F}"

  L2_F='007m%}'
  L2_B='067m%}'
  L2="${BG}${L2_B}${FG}${L2_F}"

  echo "${L1} %* ${BG}${L2_B}${FG}${L1_B}${sharp} ${L2}%? ${RESET}${FG}${L2_B}${sharp} ${RESET}"
}
if [[ "$LANG" =~ 'UTF-8$' ]]; then
  # PROMPT="`zsh-left-prompt`"
  # eval "$(starship init zsh)"
fi
