" Ji You
" General  {{{
syntax enable
set synmaxcol=300
set nobackup
set nowritebackup
set nohidden
if exists('g:started_by_firenvim')
  set nonumber norelativenumber
  set laststatus=0
else
  set number relativenumber
  set laststatus=2
endif
set mouse=a
set clipboard=unnamed
set signcolumn=yes
set splitbelow
set splitright
set foldenable
set foldlevelstart=10
set modelines=1
let g:ruby_indent_assignment_style='variable'
set expandtab
set tabstop=2
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
if has("persistent_undo")
    set undodir=~/.config/nvim/.undo
    set undofile
endif
set autowrite
set autowriteall
set autoread
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
augroup save
  au!
  au FocusLost * wall
augroup END
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
set updatetime=100
filetype on
" }}}

" Keymaps ⌨ {{{
nmap <Plug>DuplicateRubyBlock yarp
nmap crp <Plug>DuplicateRubyBlock
let g:mapleader=" "
inoremap kj <Esc>
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
vnoremap v $h
nnoremap <C-E> 2<C-E>
nnoremap <C-Y> 2<C-Y>
nnoremap H gT
nnoremap L gt
noremap <silent> <F4> :let @+=join([expand('%'),  line(".")], ':')<CR>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <silent> <esc><esc> :nohl<CR>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-B> <Left>
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

" Plugs 🔌 {{{
call plug#begin('~/.vim/plugged')
Plug 'rhysd/git-messenger.vim'
Plug 'andymass/vim-matchup'
Plug 'skanehira/preview-markdown.vim'
Plug 'junegunn/vim-github-dashboard'
Plug 'bfredl/nvim-miniyank'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'kassio/neoterm'
Plug 'wsdjeg/vim-fetch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'zackhsi/fzf-tags'
Plug 'kassio/neoterm'
Plug 'NLKNguyen/papercolor-theme'
Plug 'qpkorr/vim-bufkill'
Plug 'benmills/vimux'
Plug 'endel/vim-github-colorscheme'
Plug 'rhysd/committia.vim'
Plug 'mbbill/undotree'
Plug 'miyakogi/seiya.vim'
Plug 'mhinz/vim-startify'
Plug 'brooth/far.vim'
Plug 'junegunn/gv.vim'
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
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
"Plug 'RRethy/vim-illuminate'
Plug 'thoughtbot/vim-rspec'
Plug 'edkolev/tmuxline.vim'
Plug 'kana/vim-textobj-line'
Plug 'markonm/hlyank.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'honza/vim-snippets'
Plug 'chrisbra/csv.vim'
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
Plug 'tpope/vim-sleuth'
"Plug 'dense-analysis/ale'
Plug 'lifepillar/vim-solarized8'
Plug 'chrisbra/csv.vim'
"Plug 'cormacrelf/vim-colors-github'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
" }}}

" Coc {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nmap ge :CocCommand explorer<CR>

nmap <silent> cfj <Plug>(coc-float-jump)
nmap <silent> cfh <Plug>(coc-float-hide)

nmap <silent> rf <Plug>(coc-refactor)
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <leader>e  :<C-u>CocList --normal mru<cr>
nnoremap <silent> <leader>g  :<C-u>CocList --normal branches<CR>

imap <C-l> <Plug>(coc-snippets-expand)
vmap <tab> <Plug>(coc-snippets-expand)
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

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

"nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" }}}

" Coc-Git {{{
" navigate chunks of current buffer
"nmap [g <Plug>(coc-git-prevchunk)
"nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
"nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
"nmap gc <Plug>(coc-git-commit)
"nmap ga :CocCommand git.chunkStage<cr>
"nmap gu :CocCommand git.chunkUndo<cr>
" create text object for git chunks
"omap ig <Plug>(coc-text-object-inner)
"xmap ig <Plug>(coc-text-object-inner)
"omap ag <Plug>(coc-text-object-outer)
"xmap ag <Plug>(coc-text-object-outer)

" }}}

" Color {{{
"set termguicolors
"let ayucolor="dark"
"let ayucolor="mirage"
"let ayucolor="light"
"colorscheme ayu
colorscheme PaperColor
set background=light
"hi Normal guibg=NONE ctermbg=NONE
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
\         'allow_italic' : 1
  \     }
  \   }
  \ }
" }}}

" Dispatch {{{
" }}}"

" Floaterm {{{
let g:floaterm_position='center'

noremap  <silent> <F12> :FloatermToggle<CR>i
noremap! <silent> <F12> <Esc>:FloatermToggle<CR>i
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
" }}}

" Fugitive {{{
"nmap gc :Gcommit -v
" }}}

" Fzf {{{
" Jump to the existing window if possible
"let g:fzf_buffers_jump = 1
" Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

nmap <C-]> <Plug>(fzf_tags)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" releative file path completion
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" Better command history with q:
command! CmdHist call fzf#vim#command_history()
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history()
nnoremap q/ :QHist<CR>

nnoremap <silent> <Leader>; :Commands<CR>

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set nonu nornu laststatus=0 noshowmode noruler
  autocmd  FileType fzf hi Normal guifg=#657b83 guibg=#fdf6e3
    \| autocmd BufLeave <buffer> set laststatus=2 showmode
augroup END

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

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

nmap ; :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>o :BLines<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>ch :History:<CR>
" }}}

" Gitgutter {{{
nmap gl <Plug>(GitGutterQuickFix)
nmap ga <Plug>(GitGutterStageHunk)
vmap ga <Plug>(GitGutterStageHunk)
nmap gu <Plug>(GitGutterUndoHunk)
nmap gf <Plug>(GitGutterFold)
nmap gs <Plug>(GitGutterPreviewHunk)
" }}}

" Goyo {{{
let g:goyo_linenr = 0
let g:goyo_width = 100

nnoremap \p :Goyo<cr>
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

" nvim-miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)
" }}}

" Custom Commands{{{
command! KittyDiff !git difftool --no-symlinks --dir-diff
"<leader> }}}

" GHDashboard {{{
let g:github_dashboard = { 'username': 'kroyagis', 'password': $GHDASHBOARD_GITHUB_TOKEN }
" let g:github_dashboard['api_endpoint'] = 'https://github.com/nulogy/PackManager/api/v3'
" let g:github_dashboard['web_endpoint'] = 'https://github.com/nulogy/PackManager'
" }}}

" nnn {{{
let g:nnn#command = 'nnn -H'
nnoremap ,n :NnnPicker '%:p:h'<CR>

let g:nnn#set_default_mappings = 0
let g:nnn#layout = 'new'

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" Floating window (neovim)
"function! s:layout()
"  let buf = nvim_create_buf(v:false, v:true)
"
"  let height = &lines - (float2nr(&lines / 3))
"  let width = float2nr(&columns - (&columns * 2 / 3))
"
"  let opts = {
"        \ 'relative': 'editor',
"        \ 'row': 2,
"        \ 'col': 8,
"        \ 'width': width,
"        \ 'height': height
"        \ }
"
"  call nvim_open_win(buf, v:true, opts)
"endfunction

" let g:nnn#layout = 'call ' . string(function('<SID>layout')) . '()'
" }}}

" Peekaboo {{{
let g:peekaboo_window = 'vert bo 50new'
" }}}

" Switch {{{
let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   ['☐', '☑'],
    \   ['enable', 'disable'],
    \ ]
" }}}

" neoterm {{{
let g:neoterm_default_mod='tab'

" 3<leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>
" }}}

" Test {{{
let test#strategy = "dispatch"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

let test#strategy = {
  \ 'nearest': 'neoterm',
  \ 'file': 'dispatch'
\}
" }}}

" Tmuxline {{{
let g:tmuxline_powerline_separators = 1
"let g:tmuxline_preset = {
"      \'a'    : '#S',
"      \'b'    : '#W',
"      \'c'    : '#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
"      \'win'  : '#I #W',
"      \'cwin' : '#I #W',
"      \'x'    : '%a',
"      \'y'    : '#W %R',
"      \'z'    : '#H'}
" }}}

" undotree {{{
nnoremap <F5> :UndotreeToggle<cr>
"}}}

" Firenvim {{{
" if exists('g:started_by_firenvim')
"   set laststatus=0
"   set nonumber
" else
"   set laststatus=2
" endif

let g:firenvim_config = {
    \ 'localSettings': {
        \ 'atlassian.net': {
            \ 'selector': '',
        \ },
        \ 'slack.com': {
            \ 'selector': '',
        \ }
    \ }
\ }

au BufEnter github.com_*.txt set filetype=markdown
" }}}

" indentLine{{{
let g:indent_guides_auto_colors = 0
let g:indentLine_char = '┊'
" }}}

" vim-indent-guides{{{
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=red   ctermbg=white
"hi IndentGuidesEven guibg=green ctermbg=255
"let g:indent_guides_enable_on_vim_startup = 1
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=255
"let g:indent_guid_start_level=2
"let g:indent_guide_size=1
" }}}
"
" vim:foldmethod=marker:foldlevel=0
