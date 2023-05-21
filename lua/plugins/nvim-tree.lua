return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function my_on_attach(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
            vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))

            vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', 'L', api.node.open.tab, opts('Open: New Tab'))
            vim.keymap.set('n', '<S-CR>', api.node.open.tab, opts('Open: New Tab'))
            vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
            vim.keymap.set('n', 'o', api.node.open.vertical, opts('Open: Vertical Split'))
            vim.keymap.set('n', 'O', api.node.open.horizontal, opts('Open: Horizontal Split'))

            vim.keymap.set('n', 'i', api.node.show_info_popup, opts('Info'))
            vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))

            vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
            vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
            vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
            vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
            vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
            vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))


            vim.keymap.set('n', 'e', api.tree.expand_all, opts('Expand All'))
            vim.keymap.set('n', 'E', api.tree.collapse_all, opts('Collapse All'))

            vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
            vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
            vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))

            vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
            vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
            vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))

            vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
            vim.keymap.set('n', 'M', api.marks.bulk.move, opts('Move Bookmarked'))

            vim.keymap.set('n', 'q', api.tree.close, opts('Close'))

            -- vim.keymap.set('n', '<C-x>', api.node.open.vertical,                opts('Open: Vertical Split'))
            -- vim.keymap.set('n', '<C-h>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
        end

        require("nvim-tree").setup({
            auto_reload_on_write = true,
            disable_netrw = false,
            hijack_cursor = false,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            sort_by = "name",
            root_dirs = {},
            prefer_startup_root = false,
            sync_root_with_cwd = false,
            reload_on_bufenter = false,
            respect_buf_cwd = false,
            on_attach = my_on_attach,
            remove_keymaps = false,
            select_prompts = false,
            view = {
                centralize_selection = false,
                cursorline = true,
                debounce_delay = 15,
                width = 30,
                hide_root_folder = false,
                side = "left",
                preserve_window_proportions = false,
                number = false,
                relativenumber = false,
                signcolumn = "yes",
                mappings = {
                    custom_only = false,
                    list = {
                    },
                },
                float = {
                    enable = false,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = 30,
                        height = 30,
                        row = 1,
                        col = 1,
                    },
                },
            },
            renderer = {
                add_trailing = false,
                group_empty = false,
                highlight_git = false,
                full_name = false,
                highlight_opened_files = "icon",
                highlight_modified = "none",
                root_folder_label = ":~:s?$?/..?",
                indent_width = 2,
                indent_markers = {
                    enable = false,
                    inline_arrows = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        bottom = "─",
                        none = " ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                    modified_placement = "after",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                        modified = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "",
                        modified = "●",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
                special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                symlink_destination = true,
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = false,
                update_root = false,
                ignore_list = {},
            },
            system_open = {
                cmd = "",
                args = {},
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
                show_on_open_dirs = true,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
                git_clean = false,
                no_buffer = false,
                custom = {},
                exclude = {},
            },
            filesystem_watchers = {
                enable = true,
                debounce_delay = 50,
                ignore_dirs = {},
            },
            git = {
                enable = true,
                ignore = false,
                show_on_dirs = true,
                show_on_open_dirs = true,
                timeout = 400,
            },
            modified = {
                enable = false,
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false,
                },
                expand_all = {
                    max_folder_discovery = 300,
                    exclude = {},
                },
                file_popup = {
                    open_win_config = {
                        col = 1,
                        row = 1,
                        relative = "cursor",
                        border = "shadow",
                        style = "minimal",
                    },
                },
                open_file = {
                    quit_on_open = false,
                    resize_window = true,
                    window_picker = {
                        enable = true,
                        picker = "default",
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
                remove_file = {
                    close_window = true,
                },
            },
            trash = {
                cmd = "gio trash",
            },
            live_filter = {
                prefix = "[FILTER]: ",
                always_show_folders = true,
            },
            tab = {
                sync = {
                    open = false,
                    close = false,
                    ignore = {},
                },
            },
            notify = {
                threshold = vim.log.levels.INFO,
            },
            ui = {
                confirm = {
                    remove = true,
                    trash = true,
                },
            },
            experimental = {
                git = {
                    async = true,
                },
            },
            log = {
                enable = false,
                truncate = false,
                types = {
                    all = false,
                    config = false,
                    copy_paste = false,
                    dev = false,
                    diagnostics = false,
                    git = false,
                    profile = false,
                    watcher = false,
                },
            },
        })

        vim.keymap.set('n', '<leader>e', "<cmd> NvimTreeFocus <CR>",
            { desc = '󰙅 Nvimtree', noremap = true, silent = true, nowait = true })
    end
}
