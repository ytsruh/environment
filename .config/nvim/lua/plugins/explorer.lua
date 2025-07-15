return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", -- use the latest stable v3 release
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended for icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true, -- show hidden files
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    })

    -- Optional keymap to toggle
    vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    -- Optional keymap to focus
    vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })

  end
}
