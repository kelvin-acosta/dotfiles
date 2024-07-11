return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function() vim.cmd.colorscheme("tokyonight-night") end,
        opts = {
            styles = {
                keywords = { italic = false },
            }
        },
    },
}
