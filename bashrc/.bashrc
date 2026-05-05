#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias timeshift='sudo timeshift-launcher'
alias rustbook='rustup doc --book'
alias build='cmake --build --preset default'
alias bottles='flatpak run com.usebottles.bottles'
alias sql='sudo -i -u postgres'
alias py='python3'
alias vpn='nordvpn'
alias vpngui='nordvpn-gui'
alias pdf='evince'

PS1='[\u@\h \W]\$ '

#pywall stuff
(cat ~/.cache/wal/sequences &)

# only open neofetch if there's no kitty windows open
if [[ "$TERM" == "xterm-kitty" ]]; then
    # Count how many kitty processes are running
    kitty_count=$(pgrep -cx kitty)

    # If this is the only kitty instance, run neofetch
    if [ "$kitty_count" -le 1 ]; then
        neofetch
    else
        neofetch --ascii_distro arch_small --disable packages resolution de wm shell theme icons terminal uptime
    fi
fi

. "$HOME/.cargo/env"

PATH=/home/tristan/.cargo/bin:/usr/local/bin:/usr/bin:/var/lib/snapd/snap/bin:/var/lib/flatpak/app

# Created by `pipx` on 2026-04-17 00:19:42
export PATH="$PATH:/home/tristan/.local/bin"
