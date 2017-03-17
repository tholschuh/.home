.PHONY: vim

plug_vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim: plug_vim
	ln -si $(CURDIR)/.vimrc ~/.vimrc

links :
	ln -s ./.bashrc ~/.bashrc
	ln -s ./.vim ~/.vim
	ln -s ./.irssi ~/.irssi
	ln -s ./ghci.conf ~/.ghc/ghci.conf
	ln -s ./xmonad/ ~/.xmonad
