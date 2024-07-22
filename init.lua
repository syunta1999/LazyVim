-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-------- オプションの設定 -----------
--- ツリーを出すプラグイン
require("nvim-tree").setup()

--------- オプションの設定 -----------

---------- ここから下はコマンド系の設定 -----------
-- disable netrw at the very start of your init.lua
-- ツリーの設定
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- 多分ツリーの設定
vim.opt.termguicolors = true

-- encoding
vim.scriptencoding = "utf-8"

-- jjをノーマルモードに戻るキーに設定
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", "fj", "<Cmd>:lua vim.lsp.buf.hover()<CR>")

-- visual
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true })

-- manipulation
vim.g.mapleader = " "
vim.opt.clipboard:append({ "unnamedplus" })
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })

-- コパイロットでタブ補完をするため、明示的に設定
-- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "copilot#Previous()", { silent = true, expr = true, script = true })
