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

set diffopt=vertical
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
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
endfunction

" Customize my Vim
set encoding=utf-8
set laststatus=2
set cpoptions+=$
set noshowmode

" Setup Solarized colorscheme
let g:solarized_contrast="high"    "default value is normal
syntax enable
set background=light
colorscheme solarized

" Set guifont
" set guifont=Source_Code_Pro_Semibold:h12
" set guifont=Menlo:h11:cANSI,Meslo_LG_M:h11:cANSI
set guifont=Consolas_for_Powerline_FixedD:h13:cANSI:cANSI,Menlo:h11:cANSI,Meslo_LG_M:h11:cANSI
set guitablabel=%N\ %t\ %M

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType autohotkey 	setlocal ts=4 sts=4 sw=4 noexpandtab autoindent number
  autocmd FileType python 	setlocal ts=4 sts=4 sw=4 tw=80 smarttab expandtab autoindent number
  autocmd FileType dosbatch	setlocal ts=4 sts=4 sw=4 noexpandtab autoindent number
  " Commenting blocks of code
  autocmd FileType autohotkey	let b:comment_leader = ";"
  autocmd FileType python,vim 	let b:comment_leader = "#"
  autocmd FileType dosbatch	let b:comment_leader = "REM"
endif

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>h :set hlsearch!<CR>

" Key mappings
nmap <silent> <F8> :TagbarToggle<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:►\ ,eol:¬
set showbreak=…

" Setup grepprg and grepformat for mack
set grepprg=mack\ --nogroup\ --column\ -k\ --nocolor\ $*
set grepformat=%f:%l:%c:%m

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: ts=%d:sts=%d:sw=%d:tw=%d:%set",
        \ &tabstop, &softtabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = b:comment_leader . l:modeline
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Setup scp
let g:netrw_scp_cmd = 'c:\"Program Files (x86)"\PuTTY\pscp.exe -q'
let g:netrw_silent = 1

" Setup Powerline
let g:Powerline_symbols = 'fancy'

" Setup Ultisnips
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Set directory for snippets
let g:UltiSnipsSnippetsDir=$VIM . "/vimfiles/UltiSnips"
