#!/bin/bash

##############################################################################
#
#  Program :	git_push v1
#  Arch    :	x86_64 
#  Author  : 	StormOS-Dev
#  Website : 	https://sourceforge.net/projects/hackman-linux/
#
##############################################################################

_msg() {
    printf "\n"
    term_cols=$(tput cols)
    str="$1"
    tput setaf 5; printf '%*s\n' "${term_cols}" '' | tr ' ' - ; tput sgr0
    tput setaf 4; printf "%*s\n" $(((${#str}+$term_cols)/2)) "$str"; tput sgr0
    tput setaf 5; printf '%*s\n' "${term_cols}" '' | tr ' ' - ; tput sgr0
}

_msg "Checking for newer files online."

git pull
_msg "Backing up everything in project folder."
git add --all .
_msg "Enter your commit message (optional)"
read input
# Committing to the repository with commit comment if given
_msg "Committing to the repository."
git commit -m "$input"
_msg "Pushing local files to Github."
git push -u origin main

_msg "Git push completed...all done!"
