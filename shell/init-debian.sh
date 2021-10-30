#!/bin/sh

set -e

installCommand() {
    apt update > /dev/null 2>&1
    for wantedCommand in "$@"; do
        if ! command -v $wantedCommand > /dev/null 2>&1
        then
            echo "install $wantedCommand"
            apt install -y $wantedCommand > /dev/null 2>&1
        fi
    done
}

installCommand zsh curl git

echo 'zsh is on version ' $(zsh --version)

echo "change default shell"
chsh -s $(which zsh) ${SUDO_USER:-$USER}

if test -z $LOCAL
then
    su - ${SUDO_USER:-$USER} -c 'sh -c "$(curl -fsSL https://raw.github.com/Thomgrus/share/main/shell/theme.sh)"'
else
    su - ${SUDO_USER:-$USER} -c "sh $LOCAL/theme.sh"
fi
