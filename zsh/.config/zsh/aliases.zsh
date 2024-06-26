#!/bin/sh

export i3='nvim ~/.config/i3/config'
export polybar='nvim ~/.config/polybar/config'
export dotfiles='cd ~/dotFiles/'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias lh='ll -h'

alias vim='nvim'

alias mirrors='sudo reflector --country France --age 6 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

alias update-arch='sudo pacman -Syy && sudo pacman -Syu && yay'
alias clean-arch='yay -sc && sudo pacman -Rns $(pacman -qdtq) && flatpak remove --unused'
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -sy --noconfirm archlinux-keyring'

alias full-hd="xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off"
alias full='xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-0 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-1 --off'

alias lg='lazygit'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gc='git commit'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias df='df -h'
alias du='du -h'

# pacman
alias install='sudo pacman -S'
alias uninstall='sudo pacman -Rsn'
