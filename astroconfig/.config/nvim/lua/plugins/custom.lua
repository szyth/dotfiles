local function setup_file_watcher()
  local uv = vim.uv or vim.loop
  local watchers = {} -- bufnr -> fs_event handle, at most one per buffer

  local function unwatch_file(bufnr)
    local fsevent = watchers[bufnr]
    if not fsevent then return end
    fsevent:stop()
    fsevent:close()
    watchers[bufnr] = nil
  end

  local function watch_file(bufnr)
    if type(bufnr) ~= "number" or not vim.api.nvim_buf_is_valid(bufnr) then return end
    local fname = vim.api.nvim_buf_get_name(bufnr)
    if fname == "" then return end

    -- BufReadPost also fires when checktime reloads the buffer: replace the old watcher instead of stacking a new one
    unwatch_file(bufnr)
    local fsevent = uv.new_fs_event()
    if not fsevent then return end
    watchers[bufnr] = fsevent
    fsevent:start(fname, {}, vim.schedule_wrap(function()
      if vim.api.nvim_buf_is_valid(bufnr) and vim.fn.getbufvar(bufnr, "&modified") == 0 then
        vim.cmd("checktime " .. bufnr)
      end
    end))
  end

  local group = vim.api.nvim_create_augroup("custom_file_watcher", { clear = true })
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    callback = function(args) watch_file(args.buf) end,
  })
  vim.api.nvim_create_autocmd("BufUnload", {
    group = group,
    callback = function(args) unwatch_file(args.buf) end,
  })
end

setup_file_watcher()


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
          ["<leader>1"] = { "[b", desc = "Previous buffer", remap = true },
          ["<leader>2"] = { "]b", desc = "Next buffer", remap = true },
           -- Custom reverse delete
          ["B"] = { "c0", desc = "Cut from cursor to start of line" },
        },
        i = {
          -- new Option+Backspace mapping, tested on Mac ONLY
          ["<M-BS>"] = { "<C-w>", desc = "Delete word backward" },
          -- Map kj to exit insert mode
          ["kj"] = { "<ESC>", desc = "Exit insert mode" },
        },
      },
      diagnostics = {
        virtual_text = false,
      },
      options = {
        opt = { -- vim.opt.<key>
          wrap = true, -- sets vim.opt.wrap
          autoread = true,
          mousescroll = "ver:1,hor:6", -- scroll one line per mouse wheel tick (default is ver:3,hor:6)
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

