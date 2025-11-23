
return {
  "kawre/leetcode.nvim",
  build = function()
    vim.cmd("TSUpdate html")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    lang = "python3",
  },
}
