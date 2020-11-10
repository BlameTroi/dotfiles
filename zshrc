# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Shell Options ...
#
# Changing Directories
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CDABLE_VARS
setopt PUSHD_TO_HOME
#
# Completion
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt HASH_LIST_ALL
#
# Expansion and Globbing
setopt MARK_DIRS
#
# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_SAVE_BY_COPY
setopt INC_APPEND_HISTORY_TIME
#
# Input/Output
setopt ALIASES
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS
setopt HASH_CMDS
setopt HASH_DIRS
#
# Job Control
setopt CHECK_JOBS
setopt CHECK_RUNNING_JOBS
setopt NOTIFY
#
# Prompting
setopt PROMPT_SUBST
setopt PROMPT_BANG
setopt PROMPT_SP
setopt PROMPT_PERCENT
#
# Scripts and Functions
setopt C_BASES
#
# ZLE
setopt VI
#
# Aliases ...
#
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias lla='ls -lA'
#
# for midnight commander until i can get a decent skin worked up
alias mc='mc -b'
#
# python virtual environments ...
alias activate-pyenv3="source ~/python-virtual-environments/pyenv3/bin/activate"
#
# no windows for emacs
alias emacs='emacs -nw'
#
# i keep forgetting to set colors for tmux
alias tmux='tmux -2'
#
# screen needs some help
alias screen='SCREENDIR=~/.screen screen'
#
# colors for mc not quite right yet
alias mc='mc -b'
#
# python3 over 2
alias python='python3'
#
# longtime basic programmer 
alias cls=clear
#
# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077
umask 033
#
# Path additions
#
# lifted from /etc/profile for my .bashrc
prependpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1:$PATH"
    esac
}
#mb=$HOME/.gem/ruby/2.5.0/bin
#[[ -d $mb ]] && prependpath "$mb"
mb=$HOME/bin
[[ -d $mb ]] && prependpath "$mb"
unset mb
unset prependpath
#
# prompt
__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}
#PS1='[\u@\h \W]\$ '
#PS1="\u@\h \W\$(__git_ps1)$ "
PS1="%n@%m %~\$(__git_ps1): "

#GOPATH=$HOME/go
#function _update_ps1() {
#    PS1="$($GOPATH/bin/powerline-go -error $?)"
#}
#
#if [ "$TERM" != "linux" ] &&  [ -f "$GOPATH/bin/powerline-go" ]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

