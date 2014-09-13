.PHONY: vim

VIM_BUNDLE = ~/.vim/bundle
NEOBUNDLE_VIM = $(VIM_BUNDLE)/neobundle.vim

$(NEOBUNDLE_VIM):
	mkdir -p ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim $(NEOBUNDLE_VIM)

vim: $(NEOBUNDLE_VIM)
	ln -si $(CURDIR)/.vimrc ~/.vimrc

links :
	ln -s ./.bashrc ~/.bashrc
	ln -s ./.vim ~/.vim
	ln -s ./.irssi ~/.irssi
	ln -s ./ghci.conf ~/.ghc/ghci.conf
	ln -s ./xmonad/ ~/.xmonad
