set number
set cursorline
syntax on

set termguicolors
colorscheme slate
colorscheme wildcharm " idk why but this will do light mode if i dont set another dark mode one first


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

map <C-A> ggvG$
imap <C-A> <Esc>ggvG$

nmap K :execute 'Man' expand('<cword>')<CR>

nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>

imap <C-V> <Esc>pa

command Reload so ~/.vimrc
command TemplateC r ~/tmpl/main.c

if filereadable($HOME.'/.vim/autoload/plug.vim')
    let g:clang_library_path='/usr/lib/libclang.so'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tagbar#enabled = 0
    let g:airline_theme='wombat'

    
    call plug#begin()

    Plug 'tpope/vim-sleuth' " autodetect tab style
    Plug 'tpope/vim-sensible' " misc things
    Plug 'tpope/vim-commentary' " lets you comment out lines (mapped to C-/)
    Plug 'KabbAmine/vCoolor.vim' " color picker (might remove)
    "Plug 'obcat/vim-sclow' " scrollbar
    Plug 'mnishz/colorscheme-preview.vim' " adds :ColorschemePreview to preview the colorschemes
    Plug 'rainglow/vim' " many colorschemes
    Plug 'xavierd/clang_complete' " c (and c++ i think) autocomplete
    Plug 'jasonccox/vim-wayland-clipboard' " adds wayland copy support
    Plug 'markonm/traces.vim' " previews substitutions (and other stuff)
    Plug 'preservim/tagbar' " like vscode outline, shows functions and variables and such
    Plug 'mg979/vim-visual-multi' " multi cursor lets gooooooo
    Plug 'elkowar/yuck.vim' " smth about eww config language i dont rember
    Plug 'fidian/hexmode' " run :Hexmode to edit in hex kinda
    Plug 'noscript/elevator.vim' " better scrollbar
    Plug 'vim-airline/vim-airline' " cool bar on the bottom
    Plug 'vim-airline/vim-airline-themes' " cool theme for cool bar
    Plug 'awelormro/Todo-highlight.vim' " highlight TODO: and other things

    call plug#end()

    colorscheme fodder-contrast
endif

" mmmmmm..... snoo...
if filereadable($HOME.'/.vim/snoo.vim')
    au BufRead,BufNewFile *.snu so ~/.vim/snoo.vim
endif

" ctrl slash for comment
map <C-/> gcc
imap <C-/> <Esc>gcci
vmap <C-/> gc

colorscheme habamax

" autocmd FileType markdown setlocal spell spelllang=en_us
