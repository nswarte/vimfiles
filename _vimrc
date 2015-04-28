source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
call pathogen#infect()
call togglebg#map("<F5>")

" Display Option
set title
set number
set ruler
set wrap
set scrolloff=3
set rnu

" Search Options
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Bell
set visualbell
set noerrorbells

set backspace=indent,eol,start
set hidden

" Mappings
:let mapleader=","

" Mappings for escaping insert and visual mode
:imap ;; <Esc>
:map ;; <Esc>

" Mapping for upper case of word in insert mode and normal mode
inoremap <leader><c-u> <Esc>viwUea
nnoremap <leader><c-u> viwUe

" Mapping for toggling nerdTree
:imap <C-n> :NERDTreeToggle<CR>
:map <C-n> :NERDTreeToggle<CR>

" Mapping for editing vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Syntax Coloration
syntax enable

filetype on
filetype plugin on
filetype indent on

" Colors
set background=dark
colorscheme solarized
set guifont=Consolas:h10
set antialias


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

