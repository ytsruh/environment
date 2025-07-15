local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
        config = function()
            vim.cmd.colorscheme("tokyonight")
            enable_transparency()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependancies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "tokyonight",
        },
    },
}
