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
Plug 'itchyny/lightline.vim'
call plug#end()
let g:deoplete#enable_at_startup = 1
let test#strategy = "vimterminal"

" colorscheme
syntax enable
" シンタックスハイライトの最大行数
set synmaxcol=200
set background=dark
colorscheme solarized

" for lightline.vim
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified', 'anzu']
  \   ]
  \ },
  \ 'component_function': {
  \   'anzu': 'anzu#search_status'
  \ }
  \ }
