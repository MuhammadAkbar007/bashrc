# .bashrc
echo "بسم الله الرحمن الرحي"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
	exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

alias tg='cd && ./install_me/Telegram/Telegram'
alias ls='lsd'
alias shut='shutdown now'
alias del='rm -rf'
alias sdcv='sdcv -c'
alias vlc='flatpak run org.videolan.VLC'
alias brave='flatpak run com.brave.Browser'

eval "$(starship init bash)"
