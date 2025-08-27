" Creator: VPR
" Created: April 20th, 2020
" Updated: August 27th, 2025

" Interpreter
:let g:python3_host_prog='/usr/bin/env python3'

" Plugins
:filetype plugin indent on
:execute pathogen#infect()

" Auto-completion
:silent! inoremap {<CR> {<cr>}<esc>ko

" Bindings
:silent! noremap <F1> :CocCommand document.disableInlayHint<CR>
:silent! noremap <Right> <Nop>
:silent! noremap <Down>  <Nop>
:silent! noremap <Left>  <Nop>
:silent! noremap <Up>    <Nop>
:silent! nnoremap ` bn<CR>
:silent! nnoremap ~ bp<CR>

" Settings
:set backspace=indent,eol,start
:set clipboard=unnamedplus
:set encoding=utf-8
:set showtabline=2
:set softtabstop=4
:set termguicolors
:set shiftwidth=4
:set nocompatible
:set splitbelow
:set splitright
:set noswapfile
:set tabstop=4
:set expandtab
:set wildmenu
:set nonumber
:set nospell
:set mouse=a
:set secure
:set hidden
:set nowrap
:set go+=a
:set exrc

":set path+=/usr/local/include
:set path+=..
:set path+=../..
:set path+=../../..
:set path+=../../../..
:set path+=**

" Appearance
:syntax enable
:color relaxed

" Airline theme
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

:let g:airline#extensions#tabline#enabled = 1

:let g:airline_powerline_fonts  = 1
:let g:airline_symbols.readonly = ''
:let g:airline_symbols.linenr   = ''
:let g:airline_symbols.branch   = ''
:let g:airline_right_alt_sep    = ''
:let g:airline_left_alt_sep     = ''
:let g:airline_right_sep        = ''
:let g:airline_left_sep         = ''
:let g:airline_theme            = "base16_solarized_dark"

" Styling -> 4 spaces
autocmd filetype c          setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd filetype cpp        setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd filetype java       setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd filetype csharp     setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Styling -> 2 spaces
autocmd filetype css        setlocal tabstop=4 shiftwidth=2 softtabstop=2
autocmd filetype html       setlocal tabstop=4 shiftwidth=2 softtabstop=2
autocmd filetype javascript setlocal tabstop=4 shiftwidth=2 softtabstop=2

" Styling -> C/C++ headers
let g:c_syntax_for_h = 1

" Line Number Toggle
:silent! nnoremap <F2> :set number!<CR>

" Nerd Tree Toggle
:silent! map      <F3> :execute "set . (&number == "" ? "number" : "nonumber")<CR>

" Color Bar Toggle
:silent! nnoremap <F4> :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>

" Build and Clean
:silent! nnoremap <F5> :!make<CR>
:silent! nnoremap <F8> :!make clean<CR>

" Custom leader map
:silent! inoremap <leader>

" Coc Improvements
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Jump to next/prev diagnostic
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
