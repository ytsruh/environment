return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
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

