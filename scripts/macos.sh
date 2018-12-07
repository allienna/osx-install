#!/bin/sh

font_library_path=~/Library/Fonts

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew dependencies
cd resources/ && { brew bundle ; brew doctor ; cd -; }

## iTerm2 ##

# download clovis color scheme
clovis_url=https://raw.githubusercontent.com/Clovis-team/clovis-open-code-extracts/master/utils/Clovis-iTerm2-Color-Scheme.itermcolors
cd resources/ && { curl -fsSLO ${clovis_url} ; cd -; }

# download and install Meslo font
meslo_url="https://github.com/powerline/fonts/raw/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf"
cd ${font_library_path} && { curl -fsSL ${meslo_url} -o "Meslo LG M Regular for Powerline.ttf" ; cd -; }

## Oh My Zsh ##
ZSH_CUSTOM=~/.oh-my-zsh/custom # bugfix

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# add Powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM}/themes/powerlevel9k

# auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

# link zsh configuration
rm ~/.zshrc
ln -s `pwd`/resources/.zshrc ~/.zshrc

# echo Force links
# brew link --force git





