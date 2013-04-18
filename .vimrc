"============================================
"               ________________________
"     .--.     /                        \
"    |o_o |   |  @gh_rinx's .vimrc      |
"    |:_/ |   /_________________________/
"   //   \ \    
"  (|     | ) 
" /'|_   _/'\ http://github.com/rinx/
" \___)=(___/ http://twitter.com/gh_rinx
"============================================

"encoding
if filereadable(expand('~/.dotfiles/vim.d/encoding.vim'))
    source ~/.dotfiles/vim.d/encoding.vim
endif

"neobundle.vim
if filereadable(expand('~/.dotfiles/vim.d/neobundle-settings.vim'))
    source ~/.dotfiles/vim.d/neobundle-settings.vim
endif

"Basic
if filereadable(expand('~/.dotfiles/vim.d/basic.vim'))
    source ~/.dotfiles/vim.d/basic.vim
endif

"Color
if filereadable(expand('~/.dotfiles/vim.d/color.vim'))
    source ~/.dotfiles/vim.d/color.vim
endif

"Key mapping
if filereadable(expand('~/.dotfiles/vim.d/map.vim'))
    source ~/.dotfiles/vim.d/map.vim
endif

" Statusline
if filereadable(expand('~/.dotfiles/vim.d/statusline.vim'))
    source ~/.dotfiles/vim.d/statusline.vim
endif

"plugin
if filereadable(expand('~/.dotfiles/vim.d/plugin_settings.vim'))
    source ~/.dotfiles/vim.d/plugin_settings.vim
endif
