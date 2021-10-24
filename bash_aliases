# This is an extension of .bashrc
# it's intention is to separate from the default .bashrc
# here we can add our custom aliass and shell functions

# c will perfome like clear
alias c=clear

# Mount using veracrypt software with shortcut veram
alias veraper='sudo veracrypt --mount /home/$USER/Documents/personal /media/veracrypt1'

# Dismount with shortcut vared
alias verad='veracrypt -d'

# Quickly connect to ProtonVPN with secure core
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

# runs the bash script in current env not as a child process
alias cbook='. cbook'

# ssh into pi_server initramfs to dycrypt
alias cryptroot='ssh -o UserKnownHostsFile=~/.ssh/known_host.initramfs root@192.168.12.115'

# ssh into pi_server
alias pi='ssh mipi@192.168.12.115'

# ssh into router
alias router='ssh root@192.168.12.1'

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
