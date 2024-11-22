# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=100000
setopt append_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt inc_append_history
setopt hist_reduce_blanks

# Autocompletion
autoload -Uz compinit promptinit
compinit

# emacs mode, for vi mode set '-v'
bindkey -e

# Load prompt themes
promptinit

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
fi

# Sources
setopt prompt_subst
# https://wiki.archlinux.org/title/zsh#Key_bindings
source ~/.fix-widgets
#source ~/.vcs-git-zsh
source ~/.git-prompt.sh

# Variables
export KUBE_EDITOR=vim

# Aliases
alias ll='ls -alF'
alias ssha='eval $(ssh-agent -s); ssh-add'
alias kc='kubectl'
alias git-list-untracked='git fetch --prune && git branch -r | awk "{print \$1}" | grep -E -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}"'
alias git-remove-untracked='git-list-untracked | xargs git branch -d'

# Prompt building
PROMPT='%B%F
%f[%(?.%F{green}%?.%F{red}%?)%f] %F{1}%n%f%b@%m:%B%F{yellow}
%/ 
%F{red}$(__git_ps1 " (%s)")
%f%D{%T} %(#.#.$) %b'


#%f[%(?.%F{green}%?.%F{red}%?)%f] %F{1}%n%f%b@%m:%B%F{yellow} %/ %F{red}${vcs_info_msg_0_}
#
# Enable checking for (un)staged changes, enabling use of %u and %c
#zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
#zstyle ':vcs_info:*' unstagedstr ' *'
#zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
#zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
#zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# original prompt
#PROMPT="%B%F
#%f[%(?.%F{green}%?.%F{red}%?)%f] %F{1}%n%f%b@%m:%B%F{yellow} %/
#%f%D{%T} %(#.#.$) %b"

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# Chapter 13.2 Simple Prompt Escapes


# Ranger
#export TERM="xterm"
# https://github.com/ranger/ranger/issues/2583#issuecomment-1146851229
export TERM="xterm-256color"
#export PATH=$PATH:/usr/local/go/bin

# DISPLAY
export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"
#export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0"

# FZF config
# https://github.com/junegunn/fzf#key-bindings-for-command-line
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

