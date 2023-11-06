"TIPS :
"To use System clipboard you need xclip installed (maybe wl-copy will work
"too)
"Install Markdown Preview :call mkdp#util#install()
"
"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=
set nohlsearch
set noshowmode

"set title"
:set title titlestring=%t titlelen=70

"don't show matching parenthesies while in insert mode
au InsertEnter * NoMatchParen 
au InsertLeave * DoMatchParen 

"vim-plug"
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'shapeoflambda/dark-purple.vim'
Plug 'peit-uiberry/corvus-purple'
Plug 'unblevable/quick-scope'
Plug 'iamcco/markdown-preview.nvim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'jiriks74/presence.nvim'"
Plug 'luochen1990/rainbow'
call plug#end()


" Always show lightline
set laststatus=2
let g:lightline = {
			\ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly','absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'gitbranch'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#8caaee', '#ef9f76', '#a6d189', '#e78284'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		}
\	}
\}

"set Colorscheme"
syntax enable
colorscheme	catppuccin-frappe
"same background as terminal, allows for transparency"
highlight Normal guibg=none
highlight NonText guibg=none
"autosave when cursor hasn't moved for 4 seconds"
:autocmd CursorHold,CursorHoldI * silent! wall

"set working directory when opening via gui file explorer"
:lcd %:p:h

"source CoC Keybinds
:so ~/Git/ConfigCrow/cocKeybinds.vim
set runtimepath^=~/Git/coc-discord-rpc/src
