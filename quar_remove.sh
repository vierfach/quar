#!/bin/bash

read -p 'What would you like to remove?: ' y
if [[ -e /usr/bin/sudo ]]; then
sudo pacman -R ${y}
else
doas pacman -R ${y}
fi
echo -n '- Removal complete.\n'