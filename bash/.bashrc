# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export EDITOR="vim"
export VISUAL="vim"
if command -v nvim &> /dev/null
then
    alias vim="nvim"
fi
set -o vi # Vim mode
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
alias prj="~/.local/scripts/tmux-sessionizer"
alias gck="~/.local/scripts/git_checkout_fzf"

export PATH="~/.local/scripts:$PATH"

# Returns 0 if vim has the given command, else 1
vim_has_command() {
    vim -es -N -c "if exists(':$1') | q | else | cq | endif"
    return $?
}

# Usage: mhchanges <path>. If empty, defaults to all changes
mhchanges() {
    commit=$(git log --first-parent master --pretty=format:'%h %cd %s' --date=format:'%Y-%m-%d %H:%M' -- $1 \
        | fzf --no-sort --preview "echo {} | cut -c 1-7 | xargs -I {} git diff --color --stat {}^ {}" \
        | cut -c 1-7)
    if [ -z "$commit" ]; then
        return
    fi
    if vim_has_command "DiffviewOpen"; then
        # Uses https://github.com/sindrets/diffview.nvim
        nvim -c "DiffviewOpen ${commit}^..$commit" 
    else
        git diff ${commit}^ $commit
    fi

}

if [ -f ~/.bashrc.work ]; then
    source ~/.bashrc.work
fi
