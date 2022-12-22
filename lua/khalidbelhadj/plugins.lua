--
--  ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
--  ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
--  ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
--  ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
--  ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
--  ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
--
--  All plugins are installed here

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- fidget
    -- TS text objects
    --
    -- GIT 
    -- fugitive
    -- rhubarb
    -- gitsigns

    -- Essential
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    -- UI
    use("akinsho/bufferline.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")

    -- Colorschemes
    use("tomasiser/vim-code-dark")
    use("dracula/vim")
    use("LunarVim/darkplus.nvim")
    use("folke/tokyonight.nvim")
    use("Everblush/everblush.vim")
    use("bluz71/vim-moonfly-colors")
    use("projekt0n/github-nvim-theme")
    use("navarasu/onedark.nvim")

    -- Features
    use("windwp/nvim-autopairs")
    use("kyazdani42/nvim-tree.lua")
    use("akinsho/toggleterm.nvim")
    use("folke/which-key.nvim")
    use("tpope/vim-surround")
    use("numToStr/Comment.nvim")
    use("folke/todo-comments.nvim")

    -- Git

    -- cmp plugins
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use( "hrsh7th/cmp-nvim-lsp")
    use( "hrsh7th/cmp-nvim-lua")

    -- Snippets
    use( "L3MON4D3/LuaSnip")
    use( "rafamadriz/friendly-snippets")

    -- LSP
    use( "neovim/nvim-lspconfig")
    use( "williamboman/mason.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("RRethy/vim-illuminate")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("BurntSushi/ripgrep")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Java
    use("mfussenegger/nvim-jdtls")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
