#!/bin/bash

# copy .Xdefaults to home directory
echo copying .Xdefaults to home directory
cp .Xdefaults ~/.Xdefaults
echo ...done

# copy .vimrc to home directory
echo copying .vimrc to home directory
cp .vimrc ~/.vimrc
echo ...done

# Install the Vim Plugins using Vundle
echo Vundle PluginInstall
vim +PluginInstall +qall
echo ...done

# Change directory and execute the font install for powerline
echo executing powerline font install
cd ~/.vim/bundle/fonts/
./install.sh
echo ...done
