return {
  "editorconfig/editorconfig-vim",
  { -- 縦線入れる
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      vim.api.nvim_set_keymap("n", "<C-_>", "gcc", {})
      vim.api.nvim_set_keymap("v", "<C-_>", "gc", {})
    end,
  },
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})
  end,
}
