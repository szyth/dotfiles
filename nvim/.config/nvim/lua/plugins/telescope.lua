return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end,
        },
        {
            'nvim-telescope/telescope-file-browser.nvim',
            config = function()
                require('telescope').load_extension('file_browser')
            end,
        },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                        ['<Esc>'] = actions.close,
                    },
                    n = {
                        ['q'] = actions.close,
                    },
                },
                -- Use `fd` instead of default `find` for find_files
                find_command = {
                    'fd', '--type', 'f', '--hidden', '--follow', '--exclude', '.git'
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
            },
        })

        -- Load extensions
        telescope.load_extension('fzf')
        telescope.load_extension('file_browser')

        -- Keymaps
        local builtin = require('telescope.builtin')
        local map = vim.keymap.set

        map('n', '<leader>ff', function()
            builtin.find_files({
                hidden = true,
                no_ignore = false,        -- .gitignore rules
                no_ignore_parent = false, -- .gitignore from parent folders
            })
        end, { desc = 'Find files (incl. .env)' })

        map('n', '<leader>fe', function()
            require('telescope').extensions.file_browser.file_browser({
                hidden = true,
                respect_gitignore = false, -- do NOT respect .gitignore
            })
        end, { desc = 'File browser (incl. .env)' })


        map('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })

        map('n', '<leader>tp', builtin.builtin, { desc = 'All Telescope pickers' })
        local opts = { noremap = true, silent = true }

        -- File pickers

        map('n', '<leader>fg', builtin.git_files, { desc = 'Find Git-tracked files' })
        map('n', '<leader>fb', builtin.buffers, { desc = 'Find open buffers' })
        map('n', '<leader>fo', builtin.oldfiles, { desc = 'Recently opened files' })
        map('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy search in current file' })


        -- Search pickers
        map('n', '<leader>fs', function() builtin.live_grep({ additional_args = { "--hidden" } }) end,
            { desc = 'Search in files (ripgrep)' })
        map('n', '<leader>fw', builtin.grep_string, { desc = 'Search current word under cursor' })
        map('n', '<leader>/', builtin.search_history, { desc = 'Search history' })

        -- Git pickers
        map('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
        map('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
        map('n', '<leader>gs', builtin.git_status, { desc = 'Git status (like `git status`)' })

        -- LSP and treesitter
        map('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
        map('n', 'gr', builtin.lsp_references, { desc = 'Find references' })
        map('n', 'gi', builtin.lsp_implementations, { desc = 'Find implementations' })
        map('n', 'gt', builtin.lsp_type_definitions, { desc = 'Go to type definition' })
        map('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Document symbols (LSP)' })
        map('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols (LSP)' })
        map('n', '<leader>ts', builtin.treesitter, { desc = 'Symbols via Treesitter' })
        map("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", { desc = "Telescope Diagnostics" })

        -- Misc pickers
        map('n', '<leader>km', builtin.keymaps, { desc = 'View keymaps' })
        map('n', '<leader>ch', builtin.commands, { desc = 'Command palette (Ex commands)' })
        map('n', '<leader>ht', builtin.help_tags, { desc = 'Help tags (manual)' })
        map('n', '<leader>:', builtin.command_history, { desc = 'Command-line history' })
        map('n', '<leader>re', builtin.resume, { desc = 'Resume last Telescope picker' })
        map('n', '<leader>tp', builtin.builtin, { desc = 'All Telescope pickers (meta)' })
    end,
}
