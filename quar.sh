    # Quar: A Lightweight AUR helper written in bash.
    # Copyright (C) 2022 drquadriple

    # Quar is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # Quar is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with Quar.  If not, see <https://www.gnu.org/licenses/>.

#! /bin/bash
while getopts S:R: options; do
        case $options in
                S) x=$OPTARG
                if [[ -d ~/.cache/quar/ ]]; then
                cd ~/.cache/quar/
                if [[ -d ~/.cache/quar/${x} ]]; then 
                rm -rf ~/.cache/quar/${x}
                fi
                git clone https://aur.archlinux.org/${x}
                cd ~/.cache/quar/${x}
                makepkg -si
                else
                mkdir ~/.cache/quar/
                cd ~/.cache/quar/
                git clone https://aur.archlinux.org/${x}
                cd ~/.cache/quar/${x}
                makepkg -si
                fi
                echo -n '- Installation Complete.\n'
                ;;
                #removal
                R) y=$OPTARG
                if [[ -e /usr/bin/sudo ]]; then
                sudo pacman -R ${y}
                else
                doas pacman -R ${y}
                fi
                echo -n '- Removal complete.\n'
                ;;
        esac
done
