set number
syntax on
let mapleader=" "
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()
