vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.opt.clipboard = ""

vim.keymap.set("n", "Q", "<C-w>w")
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "gl", "<cmd>b #<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-c><C-c>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "<C-k>", "<Esc><cmd>bprev<CR>")
vim.keymap.set("i", "<C-j>", "<Esc><cmd>bnext<CR>")
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

-- [[ commands ]]
vim.api.nvim_create_user_command("Grep", "silent! grep! <args> | cwindow | setlocal nowrap", { nargs = "+" })
vim.api.nvim_create_user_command("Mkdir", "!mkdir -p '%:h'", {})

-- go to the position where you left
vim.api.nvim_create_autocmd({ "BufReadPost" }, { command = "silent! normal! g'\"" })

-- disable ignore case in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "set noignorecase | set nolist" })
vim.api.nvim_create_autocmd({ "InsertLeave" }, { command = "set ignorecase | set list" })

-- handle resizing terminal window
vim.api.nvim_create_autocmd({ "VimResized" }, { command = "wincmd =" })

-- [[ plugins ]]
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- telescope dependency
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- treesitter: master is EOL; main branch is required for 0.12
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	-- lspconfig ships only server config data (lsp/*.lua); no require() needed
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
})

vim.cmd.colorscheme("tokyonight-night")
vim.cmd.hi("Comment gui=none")

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

require("telescope").setup({})
local tb = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", tb.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", tb.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sw", tb.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sh", tb.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sd", tb.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", tb.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader><leader>", tb.buffers, { desc = "Find buffers" })

-- treesitter: highlight ENGINE is built in; install() compiles parsers into
-- stdpath('data')/site/parser and symlinks queries into .../site/queries (both
-- already on rtp). No manual rtp setup needed once queries are linked.
require("nvim-treesitter").install({
	"bash", "c", "css", "diff", "git_config", "gitcommit", "html",
	"javascript", "json", "lua", "luadoc", "markdown", "markdown_inline",
	"php", "phpdoc", "python", "sql", "typescript", "vim", "vimdoc",
	"vue", "xml", "yaml",
})
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start(args.buf, lang)
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- LSP client + completion are built in. Generic attach here; servers are enabled
-- per-machine (phpactor in local.lua, off its own bundled binary — no mason).
vim.diagnostic.config({ virtual_text = true, signs = true, underline = false })
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		-- rename/action/refs/impl/hover are default in 0.11+; add telescope go-to-def:
		vim.keymap.set("n", "gd", tb.lsp_definitions, { buffer = ev.buf, desc = "Goto definition" })
		vim.keymap.set("n", "grr", tb.lsp_references, { buffer = ev.buf, desc = "References" })
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

if vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/local.lua") then
	require("local")
end
