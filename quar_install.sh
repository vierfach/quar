#!/bin/bash

if [[ -d ~/.cache/quar/ ]]; then
cd ~/.cache/quar/
read -p 'What would you like to install?: ' x
if [[ -d ~/.cache/quar/${x} ]]; then 
rm -rf ~/.cache/quar/${x}
fi
git clone https://aur.archlinux.org/${x}
cd ~/.cache/quar/${x}
makepkg -si
else
mkdir ~/.cache/quar/
cd ~/.cache/quar/
read -p 'What would you like to install?: ' x
git clone https://aur.archlinux.org/${x}
cd ~/Desktop/quar/${x}
makepkg -si
fi
echo -n '- Installation Complete.\n'