require("core")

require("lazy").setup({
    -- UI
    require("plugins.onedark"),
    require("plugins.nvim-web-devicons"), -- Beautiful and configurable icons
    require("plugins.lualine"),           -- Neovim statusline
    require("plugins.indent-blankline"),  -- Indentlines
    require("plugins.which-key"),         -- Popup mappings
    require("plugins.nvim-tree"),         -- File navigation
    require("plugins.nvim-treesitter"),   -- Syntax highlighting

    -- LSP


    -- Other
    require("plugins.telescope"),      -- Find
    require("plugins.gitsigns"),       -- Git diffs and more
    require("plugins.nvim-autopairs"), -- Autoclosing braces and html tags
})
