let local_init=$HOME."/.config/nvim/local_init"
if filereadable(local_init)
    exec "source ".local_init
endif

colorscheme desert
set number
set relativenumber
set numberwidth=1
set ignorecase
set listchars=eol:\\,tab:>-,space:.

set path+=**
set shiftwidth=4
set expandtab
set splitright

set noswapfile
set nobackup
set nowritebackup
set nomodeline

map E <C-w><C-w>
map 0 ^
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>
map <C-]> :ltag <C-r><C-w> \| :bw \| lopen<CR>

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

command! -nargs=1 Find silent! grep! '<args>'
command! -nargs=1 File enew | set buftype=nofile | 0read !find . -iname '*<args>*'
command! -nargs=1 Dir enew | set buftype=nofile | 0read !find . -ipath '*<args>/*'
command! Reload source ~/.config/nvim/init.vim
set grepprg=ag\ -Q\ $*

augroup quickfix
    autocmd!
    " automatic location/quickfix window
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

" go to the line where you left
au BufReadPost * silent! normal! g'"

" show trailing whitespace while not in insert mode
match todo /\s\+$/
au InsertEnter * match none
au InsertLeave * match todo /\s\+$/
