return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      -- load in the native fuzzy finder extension
      require("telescope").setup {
	extensions = {
	  fzf = {}
	}
      }
      require("telescope").load_extensions('fzf')

      -- search current directory with "<space> fn"
      vim.keymap.set("n","<space>fd", require('telescope.builtin').find_files)
      -- search neovim directory with "<space> en"
      vim.keymap.set("n","<space>en", function()
	require("telescope.builtin").find_files {
	  cwd = vim.fn.stdpath("config")
	}
    end)
  end
  }
}

