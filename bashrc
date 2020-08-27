# NOTE:
#   This bash config file is modified from Jonhoo's bashrc file.

# IMPORTANT ENV
export OPEN_NET_VM="y"
export EDITOR=vim

# Rust
if [[ -e $HOME/.cargo ]]; then
	source "$HOME/.cargo/env"
	echo -e '\e[37mbtw: Rust available so enable implicitly\e[0m';
	export RUST_BACKTRACE=1
fi

# LLVM
#export C_INCLUDE_PATH=/usr/lib/llvm-6.0/lib/clang/6.0.0/include"${C_INCLUDE_PATH+:}${C_INCLUDE_PATH-}"


# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
	# non-interactive
	alias echo=/bin/false
fi

# Make sure terminal is recognized
faking="no"
if [[ "$TERM" == "rxvt-unicode-256color" && ! -e "/usr/share/terminfo/r/$TERM" ]]; then
	if [ -e "/usr/share/terminfo/r/rxvt-256color" ]; then
		faking="nounicode"
		export TERM='rxvt-256color';
	else
		faking="vt100"
		export TERM='vt100';
	fi
fi

## I largely use this for remote server
export TERM=xterm

# Be nice to sysadmins
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
	source /etc/bash.bashrc
fi

# And to users who like to tweak
if [ -e "$HOME/.local/bashrc" ]; then
	source "$HOME/.local/bashrc"
fi

# Weston needs some custom vars
if [[ ! -z `pgrep weston` ]]; then
	export GDK_BACKEND="wayland"
	export CLUTTER_BACKEND="wayland"
	export SDL_VIDEODRIVER="wayland"
	export QT_QPA_PLATFORM="wayland-egl"
fi

[[ $- != *i* ]] && return;

# Don't autocomplete to hidden directories
bind 'set match-hidden-files off'

# Make working with Java a bit easier
export CLASSPATH="$CLASSPATH:."
if [ -e /usr/share/java ]; then
	export CLASSPATH="$CLASSPATH:/usr/share/java"
fi

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"

# Autocomplete ignore
# LaTeX
export FIGNORE="$FIGNORE:.aux:.out:.toc"

# make less better
# X = leave content on-screen
# F = quit automatically if less than one screenfull
# R = raw terminal characters (fixes git diff)
#     see http://jugglingbits.wordpress.com/2010/03/24/a-better-less-playing-nice-with-git/
export LESS="-F -X -R"

# Color aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# Common aliases
alias more='less'
# Convenience aliases
alias lll='ls -la'
alias ll='ls -l'
alias l='ls'
alias run='sudo systemctl start'
alias restart='sudo systemctl restart'
alias stop='sudo systemctl stop'
alias x='sudo netctl'
alias xt='date +%s'
alias ..='cd ..'
alias sduo='sudo'
alias workon='source .venv/bin/activate'
# make
alias ,='make'
# file handlers
#alias o='xdg-open'

# editing
alias e='$EDITOR'
alias Ev='vim ~/.config/nvim/init.vim'
alias Eb='vim ~/.bashrc'

# Safety first
alias mv='mv -i'

# git alias
alias gs="git status"
alias gits="git status"
alias gl="git log --graph --decorate --oneline"
alias gc='git clone'
alias cc="checkout -- ."
alias gs='git status -s'
alias ca='git commit -a -m'
alias lazy="git add -A && git commit -m 'Update some files' && git push "
alias cnet="git clone git@github.com:jethrosun/NetBricks.git -b dev ~/dev/netbricks && cd ~/dev/netbricks && ./build.sh"

# use nvim if I set it up
if type nvim >/dev/null 2>/dev/null; then
	alias vi=nvim
	alias vim=nvim
	export EDITOR=nvim
fi

# Type - to move up to top parent dir which is a repository
function - {
local p=""
for f in `pwd | tr '/' ' '`; do
	p="$p/$f"
	if [ -e "$p/.git" ]; then
		cd "$p"
		break
	fi
done
}

# Replace part of current path and cd to it
function cdd {
	cd `pwd | sed "s/$1/$2/"`
}

# source the devstack xxx file if I am in a devstack
if [ -e /opt/stack/devstack/openrc ]; then
	source /opt/stack/devstack/openrc
fi

export LD_LIBRARY_PATH=/usr/local/lib

# NetBricks Env
#if [ -e $HOME/dev/netbricks/native ]; then
#echo -e "\e[37mbtw: enabling __libzcsi__ from the default location...\e[0m";
#export LD_LIBRARY_PATH=/usr/local/lib:~/dev/netbricks/native
#fi

# OpenNetVM Env
if [ -e /home/jethros/dev/openNetVM ]; then
	if [[ "$OPEN_NET_VM" ]]; then
		export ONVM_HOME=/home/jethros/dev/openNetVM
		export RTE_SDK=/home/jethros/dev/openNetVM/dpdk
		export RTE_TARGET=x86_64-native-linuxapp-gcc
		export ONVM_NUM_HUGEPAGES=10
		export ONVM_NIC_PCI=" 01:00.0 01:00.1 "
	fi
fi

# just to make my life easier..
if [ -e ~/dev/netbricks/ ]; then
	alias net="cd ~/dev/netbricks/"
	alias netd="cd ~/dev/netbricks/3rdparty/dpdk/examples"
	alias lpm="cd ~/dev/netbricks/test/lpm/"
	alias chain="cd ~/dev/netbricks/test/chain-test/"
	alias op="cd ~/dev/openNetVM/"
	alias opd="cd ~/dev/openNetVM/dpdk/examples"
	alias pg="cd ~/dev/pktgen-dpdk/"
	alias recon="cd ~/dev/netbricks/test/tcp-reconstruction"

	alias tl="transmission-remote -n 'transmission:mypassword' -l"
fi

if [ -e ~/.pyenv/ ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	if command -v pyenv 1>/dev/null 2>&1; then
		eval "$(pyenv init -)"
	fi
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PROTOBUF=/snap/protobuf/current
export PROTOC="$PROTOBUF/bin/protoc"
export PROTOBUF_LIBS="-L$PROTOBUF/lib -lprotobuf -D_THREAD_SAFE"
export PROTOBUF_CFLAGS="-I$PROTOBUF/include -D_THREAD_SAFE" 

echo
# end of [.bashrc]

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
