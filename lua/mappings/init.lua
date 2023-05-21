        local function opts(desc)
            return { desc = desc, noremap = true, silent = true, nowait = true }
        end
 
        -- Gitsings
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

        -- Telescope
        -- find
        vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>', opts('Find files'))
        vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>',
            opts('Find all'))
        vim.keymap.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', opts('Live grep'))
        vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>', opts('Find buffers'))
        vim.keymap.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', opts('Help page'))
        vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>', opts('Find oldfiles'))
        vim.keymap.set('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>',
            opts('Find in current buffer'))

        -- git
        vim.keymap.set('n', '<leader>gc', '<cmd> Telescope git_commits <CR>', opts('Telescope: Git commits'))
        vim.keymap.set('n', '<leader>gs', '<cmd> Telescope git_status <CR>', opts('Telescope: Git status'))

        -- other
        vim.keymap.set('n', '<leader>fm', '<cmd> Telescope marks <CR>', opts('Telescope bookmarks'))
