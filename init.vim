silent! source $HOME/.config/nvim/local.vim

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

" automatic location/quickfix window
autocmd QuickFixCmdPost [^l]* cwindow

" go to the line where you left
autocmd BufReadPost * silent! normal! g'"

" show trailing whitespace while not in insert mode
match todo /\s\+$/
autocmd InsertEnter * match none
autocmd InsertLeave * match todo /\s\+$/
