"
" Sam Ahrend - .VIMRC
"  20141128
"  Basic Options {{{
"  execute pathogen#infect()

set t_Co=256

set nocompatible
set hlsearch
set incsearch
set listchars=tab:»·,trail:~,eol:¬
set background=dark
set history=1000
set undoreload=10000
set foldmethod=marker
set ignorecase
set cursorline
set wildmenu
set ts=2
set shiftwidth=4
set scrolloff=4
set undofile
set undoreload=10000
colorscheme ron
"  }}}
" Backup Directories {{{
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
" }}}
" Auto commands  {{{
" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =
" }}}

" Abbreveations {{{

iabbr email sahrend@yahoo.com
iabbr flase false


" }}}

" Mappings {{{
" Space to toggle folds.

" Learn to not use the arrow keys
no <up> <Nop>
no <right> <Nop>
no <left> <Nop>
no <down> <Nop>

ino <up> <Nop>
ino <right> <Nop>
ino <left> <Nop>
ino <down> <Nop>

vno <up> <Nop>
vno <right> <Nop>
vno <left> <Nop>
vno <down> <Nop>

nnoremap <Space> za
vnoremap <Space> za

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap ; :

let mapleader = "\\"
noremap <leader>md :set filetype=markdown<CR>
noremap <leader>s :w<CR>
noremap <leader>w <C-w>w
noremap <leader>nt :tabnew<CR>
noremap <leader>vw :vsp  
noremap <leader>l :set list!<CR>
noremap <leader>n :set number!<CR>
vnoremap <leader>f :fold<CR>zc
noremap <leader>mo :colorscheme ron<CR>
noremap <leader>ni :colorscheme evening<CR>
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
nnoremap <leader>ev :vsp ~/.vimrc<CR>
" }}}

