# this Makefile is just a draft!!
DOTDIR := \
    ~/.dotfiles
DOTFILES := \
    vimrc \
    zshrc \
    tmux.conf \
    gitconfig \
    gitignore \
    gitattributes_global \
    latexmkrc \
    vimshrc

# color palletes
C_WHITE := "\033[00m"
C_RED := "\033[0;31m"
C_GREEN := "\033[0;32m"
C_YELLOW := "\033[0;33m"
C_BLUE := "\033[0;34m"
C_PINK := "\033[0;35m"
C_CYAN := "\033[0;36m"
C_RED2 := "\033[1;31m"
C_GREEN2 := "\033[1;32m"
C_YELLOW2 := "\033[1;33m"
C_BLUE2:= "\033[1;34m"
C_PINK2 := "\033[1;35m"
C_CYAN2 := "\033[1;36m"

all: \
    deploy \
    init \
    test \
    check-commands

# make symbolic links to the dotfiles
deploy: \
    prepare-deploy \
    vim-deploy \
    git-deploy \
    tmux-deploy \
    zsh-deploy \
    others-deploy
	@echo $(C_CYAN)===$(C_WHITE)
	@echo $(C_CYAN)deploy stage has been done$(C_WHITE)
	@echo $(C_CYAN)===$(C_WHITE)
	@echo
	# sh setup.sh -af


# initialize all configures
init: \
    prepare-init \
    vim-init \
    tmux-init
	@echo $(C_GREEN)===$(C_WHITE)
	@echo $(C_GREEN)initialize stage has been done$(C_WHITE)
	@echo $(C_GREEN)===$(C_WHITE)
	@echo

test: \
    prepare-test
	@echo $(C_BLUE)===$(C_WHITE)
	@echo $(C_BLUE)test stage has been done$(C_WHITE)
	@echo $(C_BLUE)===$(C_WHITE)
	@echo

# check whether required commands are installed
check-commands: \
    prepare-check-commands
	@echo $(C_BLUE)===$(C_WHITE)
	@echo $(C_BLUE)check-commands stage has been done$(C_WHITE)
	@echo $(C_BLUE)===$(C_WHITE)


clean: \
    prepare-clean
	@echo $(C_YELLOW)===$(C_WHITE)
	@echo $(C_YELLOW)clean stage has been done$(C_WHITE)
	@echo $(C_YELLOW)===$(C_WHITE)
	# sh setup.sh -ac

# deploy

prepare-deploy:
	@echo $(C_CYAN)===$(C_WHITE)
	@echo $(C_CYAN)deploy stage$(C_WHITE)
	@echo $(C_CYAN)===$(C_WHITE)

vim-deploy:
	@echo vim-deploy$(C_WHITE)
	@echo ===$(C_WHITE)
	# ln -s $(DOTDIR)/vimrc $(HOME)/.vimrc
	# ln -s $(DOTDIR)/vimshrc $(HOME)/.vimshrc
	@echo install dein for Vim$(C_WHITE)
	@echo ---$(C_WHITE)
	# mkdir -p $HOME/.vim/dein/repos/github.com/Shougo
	# git clone https://github.com/Shougo/dein.vim $HOME/.vim/dein/repos/github.com/Shougo/dein.vim > /dev/null 2>&1

neovim-deploy:
	@echo neovim-deploy$(C_WHITE)
	@echo ===$(C_WHITE)
	# mkdir -p $HOME/.config/nvim
	# ln -s $DOTDIR/nvimrc $HOME/.config/nvim/init.vim
	@echo install dein for NeoVim$(C_WHITE)
	@echo ---$(C_WHITE)
	# mkdir -p $HOME/.config/nvim/dein/repos/github.com/Shougo
	# git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim > /dev/null 2>&1

git-deploy:
	@echo git-deploy$(C_WHITE)
	@echo ===$(C_WHITE)
	# ln -s $(DOTDIR)/gitconfig $(HOME)/.gitconfig
	# ln -s $(DOTDIR)/gitignore $(HOME)/.gitignore
	# ln -s $(DOTDIR)/gitattributes_global $(HOME)/.gitattributes_global

tmux-deploy:
	@echo tmux-deploy$(C_WHITE)
	@echo ===$(C_WHITE)
	# ln -s $(DOTDIR)/tmux.conf $(HOME)/.tmux.conf
	@echo tmux plugin manager$(C_WHITE)
	@echo ---$(C_WHITE)
	# mkdir -p $HOME/.tmux
	# ln -s $DOTDIR/dottmux/plugins $HOME/.tmux/plugins
	@echo getipaddr binary$(C_WHITE)
	@echo ---$(C_WHITE)
	# wget https://gist.github.com/raw/9885825/getipaddr -O $HOME/.bin/getipaddr > /dev/null 2>&1
	# chmod +x $HOME/.bin/getipaddr

zsh-deploy:
	@echo zsh-deploy$(C_WHITE)
	@echo ===$(C_WHITE)
	# ln -s $(DOTDIR)/zshrc $(HOME)/.zshrc

others-deploy:
	@echo others-deploy$(C_WHITE)
	@echo ===$(C_WHITE)
	# ln -s $(DOTDIR)/latexmkrc $(HOME)/.latexmkrc

# init
prepare-init:
	@echo $(C_GREEN)===$(C_WHITE)
	@echo $(C_GREEN)initialize stage$(C_WHITE)
	@echo $(C_GREEN)===$(C_WHITE)

vim-init:
	@echo vim-init$(C_WHITE)
	@echo ===$(C_WHITE)
	@echo initialize dein for Vim$(C_WHITE)
	@echo ---$(C_WHITE)
	# vim -N -u NONE -i NONE -V1 -e -s --cmd "source $DOTDIR/vimrc" --cmd 'call dein#install()' --cmd quit

neovim-init:
	@echo neovim-init$(C_WHITE)
	@echo ===$(C_WHITE)
	@echo initialize dein for NeoVim$(C_WHITE)
	@echo ---$(C_WHITE)
	# nvim -N -u NONE -i NONE -V1 -e -s --cmd "source $DOTDIR/vimrc" --cmd 'call dein#install()' --cmd quit

tmux-init:
	@echo tmux-init$(C_WHITE)
	@echo ===$(C_WHITE)
	# git submodule update --init

# test
prepare-test:
	@echo $(C_BLUE)===$(C_WHITE)
	@echo $(C_BLUE)test stage$(C_WHITE)
	@echo $(C_BLUE)===$(C_WHITE)

# check-commands
prepare-check-commands:
	@echo $(C_BLUE)===$(C_WHITE)
	@echo $(C_BLUE)check-commands stage$(C_WHITE)
	@echo $(C_BLUE)===$(C_WHITE)

# clean
prepare-clean:
	@echo $(C_YELLOW)===$(C_WHITE)
	@echo $(C_YELLOW)clean stage$(C_WHITE)
	@echo $(C_YELLOW)===$(C_WHITE)
