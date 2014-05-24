execute pathogen#infect()

set guioptions-=TMrL
set guioptions=c
set noerrorbells
set visualbell

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin
language messages en
source $VIMRUNTIME/delmenu.vim
set langmenu=en_US.UTF-8
source $VIMRUNTIME/menu.vim

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
    endi
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Set default encoding
set encoding=utf-8

" Setup Solarized colorscheme
let g:solarized_contrast="high"    "default value is normal
syntax enable
set background=light
colorscheme solarized

" Set guifont
set guifont=Source_Code_Pro_Semibold:h12
set guitablabel=%N\ %t\ %M

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType autohotkey setlocal ts=4 sts=4 sw=4 noexpandtab autoindent number
endif

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>h :set hlsearch!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▶\ ,eol:¬
set showbreak=…

" Setup scp
let g:netrw_scp_cmd = 'c:\"Program Files (x86)"\PuTTY\pscp.exe -q'
let g:netrw_silent = 1
