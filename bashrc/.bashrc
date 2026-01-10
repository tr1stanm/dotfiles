#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias timeshift='timeshift-launcher'
alias rustbook='rustup doc --book'
PS1='[\u@\h \W]\$ '

#pywall stuff
(cat ~/.cache/wal/sequences &)

#only open neofetch if there's no kitty windows open
if [[ "$TERM" == "xterm-kitty" ]]; then
    # Count how many kitty processes are running
    kitty_count=$(pgrep -cx kitty)

    # If this is the only kitty instance, run neofetch
    if [ "$kitty_count" -le 1 ]; then
        neofetch
    fi
fi

. "$HOME/.cargo/env"
