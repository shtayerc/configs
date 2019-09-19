silent! source $HOME/.config/nvim/local.vim

colorscheme desert
set number
set relativenumber
set numberwidth=1
set ignorecase
set listchars=eol:\\,tab:>-,space:.
set pumheight=5
set shortmess+=I
set inccommand=nosplit

set path+=**
set shiftwidth=4
set expandtab
set splitright

set noswapfile
set nobackup
set nowritebackup
set nomodeline

map Q <C-w>w
map 0 ^
map <silent> <C-f> :b #<CR>
imap <silent> <C-f> <Esc>:w<CR>:b #<CR>
map <silent> <C-]> :ltag <C-r><C-w> \| :bd \| lopen<CR>
cnoremap <C-A> <Home>

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
inoremap {<CR> {<CR>}<C-o>O

command! -nargs=1 Find silent! grep! '<args>'
command! -nargs=1 -complete=file File enew | set buftype=nofile | 0read !find . -iname '*<args>*'
command! Reload source $HOME/.config/nvim/init.vim
set grepprg=ag\ --nocolor\ -Q\ $*

" automatic location/quickfix window
autocmd QuickFixCmdPost [^l]* cwindow

" go to the position where you left
autocmd BufReadPost,BufEnter * if line("`\"") > 1 | execute 'silent! normal! g`"' | endif

" show trailing whitespace while not in insert mode
match Todo /\s\+$/
autocmd InsertEnter * match none
autocmd InsertLeave * match Todo /\s\+$/

" diff colors
function! DiffColor()
    :highlight! link DiffText Todo
    :highlight! DiffAdd ctermbg=green ctermfg=black
    :highlight! DiffDelete ctermbg=red ctermfg=black
    :highlight! DiffChange ctermbg=white ctermfg=black
endfunction

autocmd BufEnter,OptionSet * if &diff | call DiffColor() | endif
