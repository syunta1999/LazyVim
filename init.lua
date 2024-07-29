-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-------- オプションの設定 -----------
-- ツリーを出すプラグイン
require("nvim-tree").setup()
-- スクロールバーを出すプラグイン
local colors = require("monokai-nightasty.colors").setup()

require("scrollbar").setup({
  handle = {
    color = colors.bg_highlight,
  },
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.error },
    Warn = { color = colors.warning },
    Info = { color = colors.info },
    Hint = { color = colors.hint },
    Misc = { color = colors.purple },
  },
})

--------- オプションの設定 -----------

---------- ここから下はコマンド系の設定 -----------
-- disable netrw at the very start of your init.lua
-- ツリーの設定
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- 多分ツリーの設定
vim.opt.termguicolors = true

-- nvim起動時にツリーを開く lazyvimのホームにいけないので使わない
-- local function open_nvim_tree()
--  -- open the tree
--  require("nvim-tree.api").tree.open()
-- end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- encoding
vim.scriptencoding = "utf-8"

-- jjをノーマルモードに戻るキーに設定
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

-- vim.keymap.set("n", "fj", "<Cmd>:lua vim.lsp.buf.hover()<CR>")
-- LSPがバッファにアタッチされたときにhoverを自動的に実行する
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.hover()
  end,
})

-- 行番号
vim.o.number = true

-- Highlight
vim.cmd("syntax on")

-- visual
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- 自動インデント（前の行から引き継ぎ）
vim.o.autoindent = true
-- インデントのネスト上げ下げ
vim.o.smartindent = true

-- ビープ音を消す
vim.o.visualbell = true
vim.o.errorbells = false
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- swpファイル出力無効
vim.o.swapfile = false
-- バックアップファイル出力無効
vim.o.backup = false
-- 保存されていないファイルがあるときは終了前に保存確認
vim.o.confirm = true

-- search
-- インクリメンタルサーチ
vim.o.incsearch = true
-- 検索で大文字小文字を無視
vim.o.ignorecase = true
vim.o.smartcase = true
-- 検索文字列をハイライトする
vim.o.hlsearch = true
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true })
-- 最後尾まで検索を終えたら次の検索で先頭に移る
vim.o.wrapscan = true
-- 変更時にガタつかないようにサイン列を常に表示しておく
vim.o.signcolumn = "yes"
-- True Color
vim.o.termguicolors = true

-- manipulation
vim.g.mapleader = " "
vim.opt.clipboard:append({ "unnamedplus" })
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"

-- Map Command + S to save the file
vim.api.nvim_set_keymap("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<D-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })

-- コパイロットでタブ補完をするため、明示的に設定
-- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "copilot#Previous()", { silent = true, expr = true, script = true })
