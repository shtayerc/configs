let local_init=$HOME."/.config/nvim/local_init"
if filereadable(local_init)
    exec "source ".local_init
endif

colorscheme desert
set number
set relativenumber
set numberwidth=1
set ignorecase

set path+=**
set shiftwidth=4
set splitright

set noswapfile
set nobackup
set nowritebackup
set nomodeline

map E <C-w><C-w>
map 0 ^
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>

"disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

"move between brackets
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

command! -nargs=1 Find silent! grep! <q-args>
set grepprg=ag\ $*

augroup quickfix
    autocmd!
    " automatic location/quickfix window
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

"filebrowser
map Q :Vex! .<CR>
let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" go to the line where you left
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" show trailing whitespace while not in insert mode
match todo /\s\+$/
au InsertEnter * match none
au InsertLeave * match todo /\s\+$/
