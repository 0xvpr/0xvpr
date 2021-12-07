" Creator: VPR
" Created: April 20, 2020
" Updated: November 15, 2021

" Interpreter
:let g:python3_host_prog='/usr/bin/env python3'

" Plugins
:filetype plugin indent on
:execute pathogen#infect()

" Auto-completion
:silent! inoremap {<CR> {<cr>}<esc>ko

" Bindings
:silent! noremap <Right> <Nop>
:silent! noremap <Down>  <Nop>
:silent! noremap <Left>  <Nop>
:silent! noremap <Up>    <Nop>
:silent! nnoremap ` gt<CR>
:silent! nnoremap ~ gT<CR>

" Settings
:set backspace=indent,eol,start
:set clipboard=unnamedplus
:set colorcolumn=80
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
:set path+=**
:set mouse=a
:set number
:set secure
:set hidden
:set nowrap
:set spell
:set go+=a
:set exrc

" Appearance
:color relaxed
:syntax enable

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

" Nerd Tree Toggle
:silent! nmap     <F2> :NERDTreeToggle<CR>
:silent! map      <F3> :NERDTreeFind<CR>

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

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

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
