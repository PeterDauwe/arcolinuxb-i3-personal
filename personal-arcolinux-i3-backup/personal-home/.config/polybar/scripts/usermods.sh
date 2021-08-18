#!/bin/bash

## Author : PeterDauwe

PDIR="$HOME/.config/polybar"
LAUNCH="polybar-msg cmd restart"

if  [[ $1 = "-Welcome" ]]; then
arcolinux-welcome-app &

 
elif  [[ $1 = "-Tool" ]]; then
arcolinux-tweak-tool &

elif  [[ $1 = "-Switcher" ]]; then
hefftor-polybar-switcher &

elif  [[ $1 = "-Track" ]]; then
exo-open "https://arcolinux.info/fast-track/" &

elif  [[ $1 = "-Hello" ]]; then
exo-open "https://arcolinux.info/arcolinux-editions/" &

else
echo "Thank You"
fi
