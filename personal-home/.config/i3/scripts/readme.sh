#!/bin/bash

groff -mom ${XDG_DATA_HOME:-$HOME/.config/i3}/scripts/readme.first -Tpdf | zathura -