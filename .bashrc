#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -n "$TMUX" ] && export TERM=xterm-256color

#start tmux if installed
if which tmux >/dev/null 2>&1; then
    # if no session is startet, start new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    #while test -z ${TMUX}; do
        #tmux attach || exit ||  break
    #done
fi


# allows saving with ctrl-s in vim
vim()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}

# use vi-style keybindings in shell
# starts in insert mode, esc to leave
set -o vi

# colored  man pages!
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;35m") \
			man "$@"
}

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# PS1='\u \w > '
PS1='\[\e[31m\]\u\[\e[m\] \[\e[34m\]\w\[\e[m\] \[\e[31m\]> \[\e[0m\]'

shopt -s autocd # cd to a dir just by typing its name
PROMPT_COMMAND='[[ ${__new_wd:=$PWD} != $PWD ]] && ls; __new_wd=$PWD' # ls after cding


#=====================
#  -All mah aliases-
#=====================

alias cd..='cd ..' # mah silly typos
alias ..='cd ..' 
alias ...='cd ../../'
alias ls='ls --color=auto' # pretty colors
alias ll="ls -lh"
alias la="ls -a"
alias lt="ll -rt"
alias lla="ls -la"
alias l.="ls -d .*"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grepr='grep -r --color=auto'
alias grepi='grep -i --color=auto'
alias grepl='grep -l --color=auto'
alias vim="stty stop '' -ixoff ; vim" # keep all my configs when run as root
alias svim='sudo vim'
alias vi='vim' # down with vi compatibility mode!
alias emacs='vim'
#alias scrot='scrot ~/pictures/screenies/%Y-%m-%d_$wx$h_scrot.png'
alias vimrc='$EDITOR $HOME/.vimrc'
alias bashrc='$EDITOR $HOME/.bashrc'
alias tmuxrc='$EDITOR $HOME/.tmux.conf'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/default/theme.lua'
alias rprc='$EDITOR $HOME/.ratpoisonrc'
alias visudo='sudo visudo'
alias pacman='pacman'
alias pac='sudo pacman -S'
alias pacs='pacman -Ss'
alias pacup='sudo pacman -Syu'
alias pacr='sudo pacman -Rns'
alias pacqs='pacman -Qs'
alias pak='sudo packer -S'
alias pakup='sudo packer -Syu'
alias paks='packer -Ss'
alias apti='sudo apt-get install'
alias apts='apt-cache search'
alias aptr='sudo apt-get remove'
alias x='xmodmap $HOME/.Xmodmap'
alias gccw='gcc -Wall -Werror -o'
alias tuxsay='fortune | cowsay -f tux'
alias wifi='sudo wifi-menu'
alias reboot="sudo shutdown -r now"
alias poweroff="sudo systemctl poweroff"
alias shutdown="sudo systemctl poweroff"
alias halt="sudo shutdown -h now"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chx='chmod 755' # gives rwx to owner and r_x to others

function today
{
    date +"%R - %A %-d %B, %Y"
}

export EDITOR="vim"
export PATH=$PATH:$HOME/bin/
