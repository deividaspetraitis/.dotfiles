# Sourced on the start of a login but after .zshrc

# Start i3 on pts0 automatically
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
