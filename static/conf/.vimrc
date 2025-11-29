set number
set cursorline
syntax on

set termguicolors
colorscheme slate
colorscheme wildcharm


set shiftwidth=4
set tabstop=4
set smarttab
set smartindent

" This makes vim ignore mouse events after pressing :
set mouse=nvi

map <A-Up> ddkP
imap <A-Up> <Esc>ddkPi
map <A-Down> ddjP
imap <A-Down> <Esc>ddjPi

imap <C-Backspace> <C-w>
imap <C-Space> <C-X><C-O>

nmap K :execute 'Man' expand('<cword>')<CR>

nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>

imap <C-V> <Esc>pi

command Reload so ~/.vimrc
command TemplateC r ~/tmpl/main.c

if filereadable($HOME.'/.vim/autoload/plug.vim')
    let g:clang_library_path='/usr/lib/libclang.so'
    
    call plug#begin()

    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'obcat/vim-sclow'
    Plug 'mnishz/colorscheme-preview.vim'
    Plug 'rainglow/vim'
    Plug 'xavierd/clang_complete'

    call plug#end()

    colorscheme fodder-contrast
endif

map <C-/> gcc
imap <C-/> <Esc>gcci
vmap <C-/> gc


" autocmd FileType markdown setlocal spell spelllang=en_us
