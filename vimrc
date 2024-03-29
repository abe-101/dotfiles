let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
" Emmet is a plugin for many popular text editors which greatly improves HTML & CSS workflow
Plug 'mattn/emmet-vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'davidhalter/jedi-vim'
Plug 'chrisbra/unicode.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'pangloss/vim-javascript'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

nnoremap <F9> :Black<CR>
" call black formater upon exit of python file
"augroup black_on_save
"  autocmd!
"  autocmd BufWritePre *.py Black
"augroup end

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file (restore to previous version)
"   if has('persistent_undo')
"     set undofile	" keep an undo file (undo changes after closing)
"   endif
" endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
" displays line number at the begining of the line
set nu

set shiftwidth=2
set softtabstop=2
set tabstop=2

autocmd Filetype python setlocal ts=4 sw=4 expandtab
" Set tabe size at 4
"set ts=4
"set sw=4
"set tabstop=4
"set shiftwidth=4
"set expandtab

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" set clipboard+=unnamedplus

" Enable syntax highlighting
syntax enable

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.

" Turn on spell check
"set spell spelllang=en_us
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
