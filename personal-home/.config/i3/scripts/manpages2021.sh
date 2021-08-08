#!/usr/bin/env bash
#
# Script name: dman
# Description: Search for a manpage or get a random one.
# Dependencies: dmenu, xargs
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Derek Taylor

# Defining the terminal emulator to use.
DMTERM="alacritty -e"

# An array of options to choose.
declare -a options=(
"Search manpages"
"Random manpage"
"Quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 30 -p 'Manpages:' "$@")

# What to do when/if we choose one of the options.
case "$choice" in
	'Search manpages')
        man -k . | awk '{$3="-"; print $0}' | \
        dmenu -i -l 30 -p 'Search for:' | \
        awk '{print $2, $1}' | tr -d '()' | xargs $DMTERM man
	;;
	'Random manpage')
        man -k . | awk '{print $1}' | shuf -n 1 | \
        #dmenu -i -c -l 30 -bw 2 -p 'Random manpage:' | xargs $DMTERM man
        xargs $DMTERM man
	;;
	'Quit')
		echo "Program terminated." && exit 0
	;;
	*)
		exit 0
	;;
esac
