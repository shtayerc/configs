silent! source $HOME/.config/nvim/local.vim

colorscheme desert
set numberwidth=1
set number relativenumber
set ignorecase smartcase
set list
set listchars=tab:-\ ,trail:.
set pumheight=5
set shortmess+=I
set inccommand=nosplit

set shiftwidth=4
set tabstop=4
set expandtab
set splitright splitbelow

set noswapfile nobackup nowritebackup
set undofile
set nomodeline
set hidden

set linebreak breakindent
set breakat=\ 
set breakindentopt=shift:4

map Q <C-w>w
map 0 ^
noremap <silent> <C-k> :bnext<CR>
noremap <silent> <C-j> :bprev<CR>
inoremap <silent> <C-k> <C-o>:bprev<CR>
inoremap <silent> <C-j> <C-o>:bnext<CR>
map <silent> <C-]> :vert stag! <C-r><C-w><CR>
cnoremap <C-A> <Home>
noremap Č :

"disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

"remap Ctrl+c to Esc
inoremap <C-C> <Esc>
noremap <C-C> <Esc>
vnoremap <C-C> <Esc>
cnoremap <C-C> <C-C><C-C>

"toggle tabs and spaces
inoremap <S-Tab> <C-o>:set expandtab!<CR>

"move between brackets
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap {<CR> {<CR>}<C-o>O

command! -nargs=1 Grep silent! grep! '<args>'
command! -nargs=1 -complete=file File enew | set buftype=nofile | 0read !find . -iname '*<args>*'
command! Reload source $HOME/.config/nvim/init.vim
set grepprg=ag\ --nocolor\ --vimgrep\ -Q\ $*

" automatic location/quickfix window
autocmd QuickFixCmdPost [^l]* cwindow

" go to the position where you left
autocmd BufReadPost * silent! normal! g'"

" disable ignore case in insert mode
autocmd InsertEnter * set noignorecase | set nolist
autocmd InsertLeave * set ignorecase | set list

" handle resizing terminal window
autocmd VimResized * wincmd =

" diff colors
function! DiffColor()
    :highlight! link DiffText Todo
    :highlight! DiffAdd ctermbg=green ctermfg=black
    :highlight! DiffDelete ctermbg=red ctermfg=black
    :highlight! DiffChange ctermbg=white ctermfg=black
endfunction

autocmd BufEnter,OptionSet * if &diff | call DiffColor() | endif
