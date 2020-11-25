# .zshenv
#
# sourced on all shell invocations. generally things that
# aren't needed for an interactive shell, which belng in
# .zshrc.
#
# Path to your oh-my-zsh installation.
export ZSH="/home/troi/.oh-my-zsh"
#
# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM="/home/troi/.zshcustom"
#
export MANPATH="/usr/local/man:$MANPATH"
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
