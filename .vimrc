set relativenumber
set mouse=a
set clipboard=unnamed
syntax on
let mapleader=" "
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'janko/vim-test'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()
let g:deoplete#enable_at_startup = 1
let test#strategy = "vimterminal"

" colorscheme
syntax enable
set background=dark
colorscheme solarized
