local function apply_ayu_folder_highlights()
        local folder_fg = "#73D0FF"

        vim.api.nvim_set_hl(0, "Directory", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "netrwDir", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "netrwClassify", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = folder_fg })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = folder_fg, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = folder_fg })
        vim.api.nvim_set_hl(0, "OilDir", { fg = folder_fg, bold = true })
end

local ayu_folder_group = vim.api.nvim_create_augroup("AyuFolderHighlights", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
        group = ayu_folder_group,
        pattern = "ayu",
        callback = function()
                apply_ayu_folder_highlights()
        end,
})

vim.api.nvim_create_autocmd("FileType", {
        group = ayu_folder_group,
        pattern = "netrw",
        callback = function()
                if vim.g.colors_name == "ayu" then
                        apply_ayu_folder_highlights()
                end
        end,
})

function ColorMyPencils(color)
        color = color or "rose-pine-moon"
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        if color == "ayu" then
                apply_ayu_folder_highlights()
                local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
                vim.api.nvim_set_hl(0, "Comment", vim.tbl_extend("force", comment_hl, { italic = true }))
        end

        -- vim.api.nvim_set_hl(0, "Search", { bg = "#FFD866", fg = "#0A0E14" })
        -- vim.api.nvim_set_hl(0, "IncSearch", { bg = "#FF8F40", fg = "#0A0E14" })
        -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#8A9199" })
        -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD866" })
end

return {

        {
                "erikbackman/brightburn.vim",
        },

        {
                "folke/tokyonight.nvim",
                lazy = false,
                opts = {},
                config = function()
                        ColorMyPencils()
                end
        },
        {
                "ellisonleao/gruvbox.nvim",
                name = "gruvbox",
                config = function()
                        require("gruvbox").setup({
                                terminal_colors = true, -- add neovim terminal colors
                                undercurl = true,
                                underline = false,
                                bold = true,
                                italic = {
                                        strings = false,
                                        emphasis = false,
                                        comments = false,
                                        operators = false,
                                        folds = false,
                                },
                                strikethrough = true,
                                invert_selection = false,
                                invert_signs = false,
                                invert_tabline = false,
                                invert_intend_guides = false,
                                inverse = true, -- invert background for search, diffs, statuslines and errors
                                contrast = "", -- can be "hard", "soft" or empty string
                                palette_overrides = {},
                                overrides = {},
                                dim_inactive = false,
                                transparent_mode = false,
                        })
                end,
        },
        {
                "folke/tokyonight.nvim",
                config = function()
                        require("tokyonight").setup({
                                -- your configuration comes here
                                -- or leave it empty to use the default settings
                                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                                transparent = true, -- Enable this to disable setting the background color
                                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                                styles = {
                                        -- Style to be applied to different syntax groups
                                        -- Value is any valid attr-list value for `:help nvim_set_hl`
                                        comments = { italic = false },
                                        keywords = { italic = false },
                                        -- Background styles. Can be "dark", "transparent" or "normal"
                                        sidebars = "dark", -- style for sidebars, see below
                                        floats = "dark", -- style for floating windows
                                },
                        })
                end
        },

        {
                "rose-pine/neovim",
                name = "rose-pine",
                config = function()
                        require('rose-pine').setup({
                                disable_background = true,
                                styles = {
                                        italic = true,
                                },
                        })

                        ColorMyPencils();
                end
        },

        {
                "ayu-theme/ayu-vim",
                name = "ayu",
                lazy = false,
                config = function()
                        vim.g.ayucolor = "dark"
                        vim.g.ayu_extended_palette = true
                        vim.g.ayu_mirage = false
                        vim.g.ayu_italic = true

                        ColorMyPencils("ayu");
                end
        },

}
