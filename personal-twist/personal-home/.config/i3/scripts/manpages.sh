#!/bin/bash

declare options=("Random
Search
Quit")

choice=$(echo -e "${options[@]}" | bobodmenu -i -c -l 30 -bw 2 -p 'Manpages : ')

case "$choice" in
	Quit)
	   echo "Program end" && exit 1
	   ;;
	Random)
	   pdf=$(find /usr/share/man/man1 -type f | shuf | head -1 )
	   man -t $pdf | ps2pdf - - | zathura -
	   ;;

    Search)
       pdf=$(man -k . | awk '{ print  $1 }' | bobodmenu  -i -c -l 30 -bw 2 -p 'Search manpages: ')
       man -t $pdf | ps2pdf - - | zathura -
       ;;
esac

