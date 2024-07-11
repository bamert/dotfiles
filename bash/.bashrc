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
#export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# Workaround for TTermux on android to correctly sow the home directory as ~
export PS1='$(current_dir=${PWD/$HOME/\~}; echo -n $current_dir)\[\033[32m\]$(parse_git_branch)\[\033[00m\] $ '

export LOCAL_INSTALL_PREFIX=~/.local
export CMAKE_INSTALL_PREFIX=$LOCAL_INSTALL_PREFIX
export PATH="$LOCAL_INSTALL_PREFIX/scripts:$PATH"
export PATH="$LOCAL_INSTALL_PREFIX/nvim-linux64/bin:$PATH"
export PATH="$LOCAL_INSTALL_PREFIX/bin:$PATH"
alias prj="$LOCAL_INSTALL_PREFIX/scripts/tmux-sessionizer"
alias gck="$LOCAL_INSTALL_PREFIX/scripts/git_checkout_fzf"
gb() { if [ -z "$1" ]; then echo "No branch name provided" >&2; return 1; else git checkout -b "$1"; fi; }

alias gp="git push"
alias gca="git commit -a"
alias gma="git merge --abort"
alias gd="git diff" 
alias gdn="git diff --name-only" 
alias gdp="git diff HEAD~1"
alias gdpn="git diff HEAD~1 --name-only"
alias ta="tmux a"



# Returns 0 if vim has the given command, else 1
vim_has_command() {
    vim -es -N -c "if exists(':$1') | q | else | cq | endif"
    return $?
}

# View diffs that past (merged) MRs introduced
# <path> optionally filters and shows only MRs that changed files in <path>
# Usage: bmerged <path>. If empty, defaults to all changes
bmerged() {
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

# View diffs of current branches vs master
# Usage: bopen 
bopen() {
    branch=$(git branch --format="%(refname)" | fzf --no-sort)  # No preview for now--preview "git diff --color --stat {}..{}" \
    if [ -z "$branch" ]; then
        return
    fi
    merge_base=$(git merge-base master $branch)
    if vim_has_command "DiffviewOpen"; then
        # Uses https://github.com/sindrets/diffview.nvim
        nvim -c "DiffviewOpen ${merge_base}..$branch" 
    else
        git diff ${merge_base}..$branch
    fi
}
rhist() {
# Use fzf to select a command from history, then edit with $EDITOR
selected_command=$(history | awk '{$1=""; print $0}' | tac | fzf)

if [[ -n $selected_command ]]; then
    # Write selected command to a temporary file
    tmpfile=$(mktemp)
    echo -e "$selected_command" > "$tmpfile"

    # Edit the command with the user's preferred editor
    ${EDITOR:-vi} "$tmpfile"

    # Read the command back from the temporary file, then run it
    read -r edited_command < "$tmpfile"
    eval "$edited_command"

    # Clean up the temporary file
    rm "$tmpfile"
fi
}

if [ -f ~/.bashrc.work ]; then
    source ~/.bashrc.work
fi
