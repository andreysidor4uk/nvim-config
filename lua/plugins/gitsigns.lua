return {
    "lewis6991/gitsigns.nvim",
    init = function()
        require('gitsigns').setup {
            signs                        = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked          = true,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm                         = {
                enable = false
            },
        }

        -- Mappings
        local function opts(desc)
            return { desc = desc, noremap = true, silent = true, nowait = true }
        end

        -- Navigation through hunks
        vim.keymap.set('n', ']h', function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                require("gitsigns").next_hunk()
            end)
            return "<Ignore>"
        end, opts('Jump to next hunk'))
        vim.keymap.set('n', '[h', function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                require("gitsigns").prev_hunk()
            end)
            return "<Ignore>"
        end, opts('Jump to prev hun'))

        -- Actions
        vim.keymap.set('n', '<leader>gr', function()
            require("gitsigns").reset_hunk()
        end, opts('Reset hunk'))
        vim.keymap.set('n', '<leader>gp', function()
            require("gitsigns").preview_hunk()
        end, opts('Preview hunk'))
        vim.keymap.set('n', '<leader>gb', function()
            package.loaded.gitsigns.blame_line()
        end, opts('Blame line'))
    end
}
