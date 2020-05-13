#!/bin/bash

#install defaults programs
echo Start downloading git, vim, curl, zsh, urxvt
sudo apt-get install --yes git vim curl zsh rxvt-unicode-256color
echo Finish downloading git, vim, curl, zsh

echo Start Cloning Vim Plugins
mkdir -p Vim/.vim/autoload Vim/.vim/bundle
curl -LSso Vim/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd Vim/.vim/bundle/
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/powerline/fonts.git
cd -
echo Finish Cloning Vim Plugins

# Install oh-my-zsh
echo install oh-my-zsh
mkdir Zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git Zsh/
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
	# If this platform provides a "chsh" command (not Cygwin), do it, man!
	if hash chsh >/dev/null 2>&1; then
		printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
		chsh -s $(grep /zsh$ /etc/shells | tail -1)
    	# Else, suggest the user do so manually.
    	else
      		printf "I can't change your shell automatically because this system does not have chsh.\n"
      		printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
	fi
fi
echo ...done
cp Zsh/templates/zshrc.zsh-template Zsh/.zshrc
sed -i -e 's/robbyrussell/agnoster/g' Zsh/.zshrc

# Change directory and execute the font install for powerline
echo executing powerline font install
cd Vim/.vim/bundle/fonts/
./install.sh
echo ...done
cd -

echo unstow in case we already have links
stow -v -D -t ~/ Vim
stow -v -D -t ~/ Xorg
stow -v -D -t ~/ Zsh
echo Remove any dot files that might be there already
rm ~/.vimrc
rm ~/.zshrc
rm ~/.Xdefaults
echo stow files
stow -v -t ~/ Vim
stow -v -t ~/ Xorg
stow -v -t ~/ Zsh
