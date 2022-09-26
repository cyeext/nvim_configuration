vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- base plugin
	use { 'wbthomason/packer.nvim' }
	-- bufferline (新增)
	use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
	-- treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { "folke/which-key.nvim", }
	use { 'p00f/nvim-ts-rainbow' }
	use { 'anuvyklack/pretty-fold.nvim',
		requires = 'anuvyklack/nvim-keymap-amend' -- only for preview
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("plugin-config.project")
		end
	}
	use {
		'lewis6991/gitsigns.nvim',
		-- tag = 'release' -- To use the latest release
	}
	use { "akinsho/toggleterm.nvim", tag = 'v1.*' }
	-- AutoSave
	use "Pocco81/AutoSave.nvim"

	-- Fold-preview
	use { 'anuvyklack/fold-preview.nvim',
		requires = 'anuvyklack/keymap-amend.nvim',
		config = function()
			require('fold-preview').setup()
		end
	}

	use 'navarasu/onedark.nvim'
	use "p00f/nvim-ts-rainbow"
	use "marko-cerovac/material.nvim"
	use "lukas-reineke/indent-blankline.nvim"
end)
