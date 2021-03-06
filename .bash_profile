#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# I've just turned emacs ediff into something I can use!
function ediff() {
    if [ "X${2}" = "X" ]; then
	echo "USAGE: ediff <FILE 1> <FILE 2>"
    else
	# The --eval flag takes lisp code and evaluates it with EMACS
	emacs --eval "(ediff-files \"$1\" \"$2\")"
    fi
}

#extend my path
PATH="/home/joshua/programming/bash:$PATH"
PACMAN="pacmatic"
DIFFEDITCMD="ediff"
pacdiff_program="ediff"
pacman_program="yaourt"

#This automagically starts x after I log in
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

#If you're using arch linux check out https://wiki.archlinux.org/index.php/Automatic_login_to_virtual_console
#It shows you how to automatically log in at the end of the boot process.

# This starts ssh-agent, which will remember my ssh password.
eval $(ssh-agent)
ssh-add
