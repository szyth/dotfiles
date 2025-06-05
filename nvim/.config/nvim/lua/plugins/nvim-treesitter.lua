return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "rust", "javascript", "typescript", "html", "css", "bash", "python", "json", "markdown"
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    })
  end,
}

