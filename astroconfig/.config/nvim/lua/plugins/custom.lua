return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { -- extend the plugin options
      mappings = {
        -- set leader 1 and 2 for buffer left and right movement
        n = {
          ["<leader>1"] = { ":bp<CR>", desc = "Previous buffer" },
          ["<leader>2"] = { ":bn<CR>", desc = "Next buffer" },
        },
      },
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
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      features = {
        inlay_hints = true, -- enable inlay hints globally on startup
      },
    },
  },
  -- uncomment to open Neo-tree by default 
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   cmd = "Neotree",
  --   opts = {
  --     filesystem = {
  --       filtered_items = {
  --         visible = true,
  --         never_show = {},
  --       },
  --     },
  --   },
  --   init = function()
  --     vim.api.nvim_create_autocmd("VimEnter", {
  --       callback = function()
  --         require("neo-tree.command").execute({ toggle = false, dir = vim.loop.cwd() })
  --       end,
  --     })
  --   end,
  -- }
}

