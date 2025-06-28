-- git clone astronvim and then place this on path
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { -- extend the plugin options
      -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      diagnostics = {
        virtual_text = false,
      },
      options = {
        opt = { -- vim.opt.<key>
          wrap = true, -- sets vim.opt.wrap
        },
      },
    },
  },
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      inlay_hints = true, -- enable inlay hints globally on startup, doesnt work for some reason
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          -- show_hidden_count = true,
          -- hide_dotfiles = false,
          -- hide_gitignored = true,
          -- hide_by_name = {
          --   ".git",
          -- '.DS_Store',
          -- 'thumbs.db',
          -- },
          never_show = {},
        },
      },
    },
  },
}
