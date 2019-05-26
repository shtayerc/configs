let snippet_file=$HOME."/.config/nvim/snippets"
if filereadable(snippet_file)
    exec "source ".snippet_file
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

map E <C-w><C-w>
map 0 ^

"disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

map <C-f> :silent! grep! 
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
