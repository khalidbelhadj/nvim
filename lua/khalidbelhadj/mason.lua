-- Add a heading with https://patorjk.com/software/taag/#p=moreopts&c=lua&f=ANSI%20Shadow&t=Neovim
-- Use ANSI Shadow

-- plugin is a place holder for whatever plugin is used
local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup({
-- Plugin options go here
})
