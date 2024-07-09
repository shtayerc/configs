vim.opt.numberwidth = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.listchars = { tab = "- ", trail = "." }
vim.opt.pumheight = 5
vim.g.editorconfig = false
vim.opt.shortmess:append({ I = true })
vim.opt.inccommand = "nosplit"
-- let g:netrw_fastbrowse = 0
-- disable mouse, we have tmux for that
vim.opt.mouse = ""

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.modeline = false
vim.opt.hidden = true

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakat = " "
vim.opt.breakindentopt = "shift:4"

vim.keymap.set("n", "Q", "<C-w>w")
vim.keymap.set("n", "0", "^")
-- vim.keymap.set('n', 'gb', '<cmd>ls<CR>:b<Space>')
vim.keymap.set("n", "gl", "<cmd>b #<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-c><C-c>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "<C-k>", "<Esc><cmd>bprev<CR>")
vim.keymap.set("i", "<C-j>", "<Esc><cmd>bnext<CR>")
-- map <silent> <C-]> :ltag <C-r><C-w> \| lopen<CR>
vim.keymap.set("n", "Č", ":")

-- disable arrow keys
-- map <Left> <Nop>
-- map <Right> <Nop>
-- map <Up> <Nop>
-- map <Down> <Nop>
-- imap <Left> <Nop>
-- imap <Right> <Nop>
-- imap <Up> <Nop>
-- imap <Down> <Nop>

-- remap Ctrl+c to Esc
vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<Esc>", { noremap = true })

-- insert tab
vim.keymap.set("i", "<S-Tab>", "<C-v><Tab>", { noremap = true })

-- move between brackets
vim.keymap.set("i", "()", "()<Left>", { noremap = true })
vim.keymap.set("i", "{}", "{}<Left>", { noremap = true })
vim.keymap.set("i", "[]", "[]<Left>", { noremap = true })
vim.keymap.set("i", '""', '""<Left>', { noremap = true })
vim.keymap.set("i", "''", "''<Left>", { noremap = true })
vim.keymap.set("i", "{<CR>", "{<CR>}<C-o>O", { noremap = true })

vim.api.nvim_create_user_command("Grep", "silent! grep! <args> | cwindow | setlocal nowrap", { nargs = "+" })
-- command! -nargs=+ Grep silent! grep! <args> | cwindow | setlocal nowrap
-- command! -nargs=1 -complete=file File enew | set buftype=nofile | 0read !find . -iname '*<args>*'
-- command! Reload source $HOME/.config/nvim/init.vim
-- command! W w
vim.api.nvim_create_user_command("Mkdir", "!mkdir -p '%:h'", {})
-- command! Mkdir :!mkdir -p '%:h'

-- go to the position where you left
vim.api.nvim_create_autocmd({ "BufReadPost" }, { command = "silent! normal! g'\"" })
--autocmd BufReadPost * silent! normal! g'"

-- disable ignore case in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "set noignorecase | set nolist" })
-- autocmd InsertEnter * set noignorecase | set nolist
vim.api.nvim_create_autocmd({ "InsertLeave" }, { command = "set ignorecase | set list" })
-- autocmd InsertLeave * set ignorecase | set list

-- handle resizing terminal window
vim.api.nvim_create_autocmd({ "VimResized" }, { command = "wincmd =" })
-- autocmd VimResized * wincmd =

vim.cmd("silent! source $HOME/.config/nvim/local.vim")
