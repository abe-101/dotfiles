# This is an extension of .bashrc
# it's intention is to separate from the default .bashrc
# allowing the debian maitainers to make changes to .bashrc
# without overiding individuals files.

# Clear terminal with c
alias c=clear

# Mount using veracrypt software with shortcut veram
alias veraper='sudo veracrypt --mount /home/$USER/personal /media/veracrypt1'

# Dismount with shortcut vared
alias verad='veracrypt -d'

# Quickly connect to ProtonVPN
alias ny11='protonvpn-cli c US-NY#11 -p tcp'
alias ny48='protonvpn-cli c US-NY#48 -p tcp'

umask 0002
alias l.='ls -d .* --color=auto'

# Set vim as default editor
export EDITOR=vim
export VISUAL=vim

# set CDPATH to a good one
CDPATH=.:/usr/share/doc:~:~/Desktop:~
export CDPATH

source ~/.local/bin/ssh_shortcut

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

neofetch

alias win11='cd /mnt/data/qemu/quickemu; ./quickemu --vm windows-11.conf --display spice'
alias macos='cd /mnt/data/qemu/quickemu; ./quickemu --vm macos-catalina.conf'
alias fedora='cd /mnt/data/qemu/quickemu; ./quickemu --vm fedora-35_beta.conf --display spice'

# quicly rotate screen
alias screenInverted='xrandr --output eDP1 --rotate inverted'
alias screenNormal='xrandr --output eDP1 --rotate normal'
