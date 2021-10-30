#!/bin/sh

set -e

if ! test -d "$HOME/.oh-my-zsh"
then
    echo "install oh-my-zsh"
    env RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already installed"
fi

if ! test -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
then
    echo "install powerlevel 10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "powerlevel 10k already installed"
fi

sed -i -E 's#ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#g' "$HOME/.zshrc"

if ! test -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
then 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting already installed"
fi

sed -i -E 's/plugins=\(((.*) zsh-syntax-highlighting)?(.*)\)/plugins=\(\2\3 zsh-syntax-highlighting\)/g' "$HOME/.zshrc"

zsh
