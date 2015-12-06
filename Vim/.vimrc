set nocompatible
filetype plugin indent on
syntax on

execute pathogen#infect()

set encoding=utf-8
set laststatus=2
set background=dark
colorscheme solarized
set t_Co=256
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extentions#tabline#showbuffers = 0
let g:airline_theme = 'molokai'
call togglebg#map("<F5>")
