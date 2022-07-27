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

-- Use dashboard theme
local dashboard = require("alpha.themes.dashboard")

-- Setting dashboard header
dashboard.section.header.val = {

    [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

}

-- Setting buttons
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/lua/user <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Don't trigger any autocommands
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
