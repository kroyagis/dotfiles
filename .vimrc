" Ji You
" General {{{
syntax enable
set synmaxcol=300
set termguicolors
set nobackup
set nowritebackup
set number relativenumber
set mouse=a
set clipboard=unnamed
set signcolumn=yes
set splitbelow
set splitright
set foldenable
set foldlevelstart=10
set modelines=1
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set scrolloff=5
set noswapfile
set belloff=all
set nostartofline
set matchpairs& matchpairs+=<:>
set showmatch
set matchtime=3
set wrap
set textwidth=0
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set shiftround
set infercase
set virtualedit=onemore
set hidden
set switchbuf=useopen
set ignorecase
set smartcase
set incsearch
set hlsearch
set showcmd
set backspace=indent,eol,start
" }}}
" Keymaps {{{
let g:mapleader=" "
inoremap kj <Esc>
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
vnoremap v $h
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
nnoremap <C-E> 2<C-E>
nnoremap <C-Y> 2<C-Y>
nnoremap H gT
nnoremap L gt
noremap <silent> <F4> :let @+=join([expand('%'),  line(".")], ':')<CR>
nnoremap <esc><esc> :nohl<CR>
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
nmap <leader>w :w!<cr>
nnoremap <silent> + :let winstate = winsaveview()<bar>
      \ exec "normal! mzgg=G`z"<bar>
      \ call winrestview(winstate)<bar>
      \ unlet winstate<cr>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
command! -count=1 -register D :+,+<count>d <reg><bar>norm! ``
" }}}
" Plugs {{{
call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-peekaboo'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'RRethy/vim-illuminate'
Plug 'thoughtbot/vim-rspec'
Plug 'edkolev/tmuxline.vim'
Plug 'kana/vim-textobj-line'
Plug 'markonm/hlyank.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'honza/vim-snippets'
Plug 'chrisbra/csv.vim'
Plug 'justinmk/vim-sneak'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'dhruvasagar/vim-zoom'
Plug 'christoomey/vim-tmux-navigator'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-bundler'
Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-commentary'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-utils/vim-ruby-fold'
Plug 'mcchrish/nnn.vim'
call plug#end()
" }}}
" Goyo {{{
let g:goyo_linenr = 0
" }}}
" Gutentags {{{
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"Use the following command to clear the cache quickly:
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ '*.js',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.zip',
      \ '*.tmp',
      \ '*.cache',
      \ 'tags*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
" }}}
" Coc {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> fj <Plug>(coc-float-jump)
nmap <silent> fh <Plug>(coc-float-hide)

nmap <silent> rf <Plug>(coc-refactor)

nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <leader>e  :<C-u>CocList -A --normal mru<cr>

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}
" Coc-Git {{{
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
nmap ga <Plug>(coc-git-stagechunk)
" create text object for git chunks
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ic <Plug>(coc-text-object-outer)
xmap ic <Plug>(coc-text-object-outer)

" }}}
" Test {{{
let test#strategy = "dispatch"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#ruby#rspec#executable = "bin/rspec"
" }}}
" Dispatch {{{
" }}}"
" Gitgutter {{{
set updatetime=100
nmap <leader>cp <Plug>GitGutterPreviewHunk
nmap <leader>ca <Plug>GitGutterStageHunk
nmap <leader>cr <Plug>(GitGutterUndoHunk)
" }}}
" Switch {{{
let g:switch_custom_definitions =
    \ [
    \   ['☐', '☑']
    \ ]
" }}}
" Fzf {{{
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
      \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always --glob=!node_modules/* '.shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview(),
      \ <bang>0)

nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>o :BLines<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>ch :History:<CR>
noremap <silent> <F12> :BTags<CR>
" }}}
" Rspec {{{
let g:rspec_command = "Dispatch RUBYOPT='-W0' bin/rspec {spec}"
" }}}
" Tmuxline {{{
let g:tmuxline_powerline_separators = 1
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
" }}}
" Ayu {{{
let ayucolor="light"
colorscheme ayu
" }}}"
" nnn {{{
" Floating window (neovim)
function! s:layout()
  let buf = nvim_create_buf(v:false, v:true)

  let height = &lines - (float2nr(&lines / 3))
  let width = float2nr(&columns - (&columns * 2 / 3))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 2,
        \ 'col': 8,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

let g:nnn#layout = 'call ' . string(function('<SID>layout')) . '()'
" }}}
" vim:foldmethod=marker:foldlevel=0
