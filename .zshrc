autoload -U compinit
compinit

# These names are case insensitive and underscores are ignored.
# For example, ‘allexport’ is equivalent to ‘A__lleXP_ort’.
setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS

bindkey \^U backward-kill-line

export PATH="${HOME}/Library/Android/sdk/platform-tools:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"

alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ls='ls -G'
alias ll='ls -lAF'
alias g='git'
alias o='open'
alias ovsc='open -a "Visual Studio Code"'

#hash -d alias=/path/to/directory

# prompt
#   FG, BG, RESET = ^[
#     Ctrl-v -> ESC
#     `echo -n ^[ | pbcopy`
#   see: http://blog.aqutras.com/entry/2016/07/11/210000
function zsh-left-prompt {
  sharp='\uE0B0'
  FG='%{[38;5;'
  BG='%{[30;48;5;'
  RESET='%{[0m%}'

  L1_F='178m%}'
  L1_B='237m%}'
  L1="${BG}${L1_B}${FG}${L1_F}"

  L2_F='007m%}'
  L2_B='067m%}'
  L2="${BG}${L2_B}${FG}${L2_F}"

  echo "${L1}%*${BG}${L2_B}${FG}${L1_B}${sharp} ${L2}%?${RESET}${FG}${L2_B}${sharp} ${RESET}"
}
PROMPT="`zsh-left-prompt`"
