-- Load the .vimrc file
vim.cmd('source $HOME/.vimrc')

-- DAMN! Copies text into System Clipboard
-- Needs `sudo apt install xclip`
-- Use y, d. // Yank or Cut
-- Use p to paste from system to nvim
vim.opt.clipboard = 'unnamedplus'

-- Automatically format files on save using built-in LSP
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        vim.lsp.buf.format()
    end,
})

require("config.lazy")
