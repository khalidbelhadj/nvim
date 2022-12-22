--
--   █████╗ ██╗   ██╗████████╗ ██████╗ ██████╗  █████╗ ██╗██████╗ ███████╗
--  ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗██╔══██╗██║██╔══██╗██╔════╝
--  ███████║██║   ██║   ██║   ██║   ██║██████╔╝███████║██║██████╔╝███████╗
--  ██╔══██║██║   ██║   ██║   ██║   ██║██╔═══╝ ██╔══██║██║██╔══██╗╚════██║
--  ██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║     ██║  ██║██║██║  ██║███████║
--  ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝
--
--  Auto closing brackets and quotations

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

npairs.setup {
    -- will ignore alphanumeric and `.` symbol
    ignored_next_char = "[%w%.]<>",

    -- Use map to close the chars at a given point
    fast_wrap = {
        map = "<C-w>", -- TODO: change this keymapping
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

-- Integration with cmp: this will add brackets to cmp completions
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
