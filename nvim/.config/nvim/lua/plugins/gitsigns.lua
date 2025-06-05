return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
            delay = 500,
            ignore_whitespace = false,
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "]h", gs.next_hunk, "Next Hunk")
            map("n", "[h", gs.prev_hunk, "Previous Hunk")
            map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
            map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
            map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
            map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
            map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
            map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
            map("n", "<leader>gd", gs.diffthis, "Diff This")
        end,
    },
}
