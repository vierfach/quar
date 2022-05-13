#! /bin/bash
while getopts S:R: options; do
        case $options in
                #installation
                S) x=$OPTARG
                if [[ -d ~/.cache/quar/ ]]; then
                cd ~/.cache/quar/
                elif [[ -d ~/.cache/quar/${x} ]]; then
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
                su -c pacman -R ${y}
                rm -rf ~/.cache/quar/${y}
                fi
                echo -n '- Removal complete.\n'
                ;;
        esac
done
