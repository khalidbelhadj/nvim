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

    -- Essential
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    -- UI
    use("lukas-reineke/indent-blankline.nvim")
    use("akinsho/bufferline.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("goolord/alpha-nvim")
    use("nvim-lualine/lualine.nvim")
    use("junegunn/goyo.vim")

    -- Features
    use("windwp/nvim-autopairs")
    use("kyazdani42/nvim-tree.lua")
    use("akinsho/toggleterm.nvim")
    use("folke/which-key.nvim")
    use("tpope/vim-surround")
    use("numToStr/Comment.nvim")
    use("folke/todo-comments.nvim")

    -- Colorschemes
    use("tomasiser/vim-code-dark")
    use("dracula/vim")
    use("LunarVim/darkplus.nvim")
    use("folke/tokyonight.nvim")
    use("Everblush/everblush.vim")
    use("bluz71/vim-moonfly-colors")
    use("projekt0n/github-nvim-theme")
    use("navarasu/onedark.nvim")

    -- cmp plugins
    use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" })
    use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" })
    use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" })
    use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" })
    use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
    use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

    -- Snippets
    use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" })
    use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" })

    -- LSP
    use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" })
    use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" })
    use("jose-elias-alvarez/null-ls.nvim")
    use("RRethy/vim-illuminate")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("BurntSushi/ripgrep")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Java
    use("mfussenegger/nvim-jdtls")

    -- R Programming
    use("jalvesaq/Nvim-R")

    -- Web Dev
    -- use("mattn/emmet-vim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
