#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.env ]] && . ~/.env
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
