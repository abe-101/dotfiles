# This is an extension of .bashrc
# it's intention is to separate from the default .bashrc
# allowing the debian maitainers to make changes to .bashrc
# without overiding individuals files.

# Clear terminal with c
alias c=clear

# Mount using veracrypt software with shortcut veram
alias veraper='sudo veracrypt --mount-options=timestamp --mount /home/$USER/Documents/personal /media/veracrypt1'

alias veragelt='sudo veracrypt --mount-options=timestamp --mount /home/$USER/Documents/gelt /media/veracrypt2'

# Dismount with shortcut vared
alias verad='sudo veracrypt -d'

# Quickly connect to ProtonVPN
alias ny47='protonvpn-cli c US-NY#47 -p udp'
alias ny48='protonvpn-cli c US-NY#48 -p udp'

umask 0002
alias l.='ls -d .* --color=auto'

# Set vim as default editor
export EDITOR=vim
export VISUAL=vim

# set CDPATH to a good one
CDPATH=.:/usr/share/doc:~:~/Desktop:~
export CDPATH

# runs the bash script in current env not as a child process
alias cbook='. cbook'
alias pybook='. pybook'

# arch wiki page within term
wiki() {
	search_term=$(echo $@ | sed 's/ /+/g')
	lynx https://wiki.archlinux.org/index.php?search=${search_term}
}

wtfis() {
	curl "https://cheat.sh/$1"
}

# System dependant aliases
if cat /etc/*release | grep ^NAME | grep Fedora; then
    # Refresh .bash_aliases
    alias bashrc="vim ~/.bashrc.d/bash_aliases && source ~/.bashrc.d/bash_aliases"
    # if user is not root, pass all commands via sudo #
    if [ $UID -ne 0 ]; then
    	alias update='sudo dnf update'
    	alias upgrade='sudo dnf upgrade'
    	alias ainstall='sudo dnf install'
    	alias shutdown='sudo shutdown now'
    	alias reboot='sudo reboot'
    	alias liup='dnf list --upgradable'
    fi
elif cat /etc/*release | grep ^NAME | grep Debian ; then
    # Refresh .bash_aliases
    alias bashrc="vim ~/.bash_aliases && source ~/.bash_aliases"
    # if user is not root, pass all commands via sudo #
    if [ $UID -ne 0 ]; then
    	alias update='sudo apt update'
    	alias upgrade='sudo apt upgrade'
    	alias ainstall='sudo apt install'
    	alias shutdown='sudo shutdown now'
    	alias reboot='sudo reboot'
    	alias liup='apt list --upgradable'
    fi
fi

# Display System Info
neofetch

# Disable middle-click paste in Linux
xbindkeys -p

# quicly rotate screen
alias screenInverted='xrandr --output eDP1 --rotate inverted'
alias screenNormal='xrandr --output eDP1 --rotate normal'
