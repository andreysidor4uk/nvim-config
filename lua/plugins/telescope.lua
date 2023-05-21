return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    init = function()
        require('telescope').setup {
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "-L",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                file_ignore_patterns = { "node_modules" },
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                -- Developer configurations: Not meant for general override
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
            }
        }

        -- Mappings
        local function opts(desc)
            return { desc = desc, noremap = true, silent = true, nowait = true }
        end

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
    end
}
