set nocompatible
syntax on
set termguicolors

set number
set relativenumber
set cursorline
set showmode
set laststatus=2

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrap

set wildmenu
set background=dark

" ──────────────────────────────
" COLOR THEME BLEU ÉLECTRIQUE + ROUGE
" ──────────────────────────────

" Fond global
hi Normal       guibg=#1b1f2a guifg=#cdd6f4
hi CursorLine   guibg=#252a36

" Numéros de ligne
hi LineNr       guifg=#8a8fa8 guibg=#1b1f2a
hi CursorLineNr guifg=#4a96e4 guibg=#1b1f2a

" Split bar
hi VertSplit    guifg=#2a2f3d guibg=#1b1f2a

" Statusline
hi StatusLine   guifg=#cdd6f4 guibg=#2a2f3d
hi StatusLineNC guifg=#8a8fa8 guibg=#1b1f2a

" Syntax highlighting
hi Comment      guifg=#5b616e
hi Constant     guifg=#4a96e4
hi String       guifg=#66d9ef
hi Identifier   guifg=#88c0ff
hi Statement    guifg=#ff273f
hi Keyword      guifg=#ff273f
hi Function     guifg=#4a96e4
hi Type         guifg=#4fd6be

" Curseur + visual mode
hi Cursor       guibg=#4a96e4
hi Visual       guibg=#2f3a4d

" Search
hi Search       guibg=#4a96e4 guifg=#000000
hi IncSearch    guibg=#ff273f guifg=#000000

" Statusline custom
set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %f\ %m
set statusline+=%=
set statusline+=%#StatusLineNC#
set statusline+=\ [%{&filetype}]\ %p%%\ %l:%c
