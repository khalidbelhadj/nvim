-- Add a heading with https://patorjk.com/software/taag/#p=moreopts&c=lua&f=ANSI%20Shadow&t=Neovim
-- Use ANSI Shadow

-- plugin is a place holder for whatever plugin is used
local status_ok, plugin = pcall(require, "plugin")
if not status_ok then
    return
end

plugin.setup({
-- Plugin options go here
})
