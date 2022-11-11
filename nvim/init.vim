call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-sandwich'
call plug#end()
 


filetype plugin indent on
set relativenumber
set encoding=utf-8
set hidden

let mapleader=","

nnoremap <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical" 

let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1

color dracula
set termguicolors
