--
--   █████╗ ██╗     ██████╗ ██╗  ██╗ █████╗
--  ██╔══██╗██║     ██╔══██╗██║  ██║██╔══██╗
--  ███████║██║     ██████╔╝███████║███████║
--  ██╔══██║██║     ██╔═══╝ ██╔══██║██╔══██║
--  ██║  ██║███████╗██║     ██║  ██║██║  ██║
--  ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝
--
--  Startup screen with Telescope options

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

-- Use startify theme
--local dashboard = require("alpha.themes.dashboard")
local dashboard = require("alpha.themes.startify")

-- Setting dashboard header
dashboard.section.header.val = {
[[    _   __                _         ]],
[[   / | / /__  ____ _   __(_)___ ___ ]],
[[  /  |/ / _ \/ __ \ | / / / __ `__ \]],
[[ / /|  /  __/ /_/ / |/ / / / / / / /]],
[[/_/ |_/\___/\____/|___/_/_/ /_/ /_/ ]],
                                    }

-- Setting buttons
--[[ dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  File Explorer", ":NvimTreeOpen<CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/lua/user <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
} ]]

-- Don't trigger any autocommands
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
