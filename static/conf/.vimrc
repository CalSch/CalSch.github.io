set number
set cursorline
syntax on
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
map <A-r> :source ~/.vimrc<CR>

imap <C-Backspace> <C-w>

command Reload so /home/calvin/.vimrc

" comments
" augroup comment_like_a_boss
    " autocmd!
    " autocmd FileType c,cpp,go,json           let b:comment_leader = '// '
    " autocmd FileType ruby,python             let b:comment_leader = '# '
    " autocmd FileType conf,fstab,sh,bash,tmux let b:comment_leader = '# '
    " autocmd FileType tex                     let b:comment_leader = '% '
    " autocmd FileType mail                    let b:comment_leader = '> '
    " autocmd FileType vim                     let b:comment_leader = '" '
" augroup END
" noremap <silent> <C-/> :<C-b>silent <C-e>norm ^i<C-r>=b:comment_leader<CR><CR>
" noremap <silent> <A-/> :<C-b>silent <C-e>norm ^xx<CR>

call plug#begin()

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

call plug#end()

map <C-/> gcc
imap <C-/> <Esc>gcci
vmap <C-/> gc

" autocmd FileType markdown setlocal spell spelllang=en_us
