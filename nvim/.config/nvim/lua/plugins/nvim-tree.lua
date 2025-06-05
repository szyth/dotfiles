
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      view = {
        width = 40,
        relativenumber = true,
      -- float = {
      --   enable = true,
      --   open_win_config = {
      --     relative = "editor",
      --     border = "rounded",
      --     width = 40,
      --     height = 30,
      --     row = 1,
      --     col = 1,
      --   },
      -- },
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      filters = {
        dotfiles = false,
      },
    })

    -- ✅ Auto-open on startup if no file is passed
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local api = require("nvim-tree.api")
        if vim.fn.argc() == 0 then
          api.tree.open()
        end
      end,
    })
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
  },
}
