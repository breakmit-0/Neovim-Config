vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function (use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag='0.1.5',
		requires = {{'nvim-lua/plenary.nvim'}}
	}

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use({ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
	use("nvim-treesitter/playground")

	use("tpope/vim-fugitive")

    use("terrortylor/nvim-comment")
    require('nvim_comment').setup()

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
        }
	}

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {'catppuccin/nvim', as="catppuccin"}
end)
