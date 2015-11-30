#!/bin/bash

#install defaults programs
echo downloading git,vim,curl,zsh
sudo apt-get install --yes git vim curl zsh
echo downloading complete

# copy .Xdefaults to home directory
echo copying .Xdefaults to home directory
cp .Xdefaults ~/.Xdefaults
echo ...done

# copy .vimrc to home directory
echo copying .vimrc to home directory
cp .vimrc ~/.vimrc
echo ...done

# clone the Vundle repo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install the Vim Plugins using Vundle
echo Vundle PluginInstall
echo 2 Vim Errors are expected because we still need to download our plugins
vim +PluginInstall +qall
echo ...done

# Change directory and execute the font install for powerline
echo executing powerline font install
cd ~/.vim/bundle/fonts/
./install.sh
echo ...done

# Install oh-my-zsh
echo install oh-my-zsh
curl sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo ...done
