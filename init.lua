--
--  ██╗███╗   ██╗██╗████████╗
--  ██║████╗  ██║██║╚══██╔══╝
--  ██║██╔██╗ ██║██║   ██║
--  ██║██║╚██╗██║██║   ██║
--  ██║██║ ╚████║██║   ██║
--  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝
--
--  Where all configurations are set

local files = {
    "options",
    "keymaps",
    "plugins",
    "colorscheme",
    "cmp",
    "lsp",
    "telescope",
    "treesitter",
    "autopairs",
    "bufferline",
    "toggleterm",
    "indentline",
    "whichkey",
    "lualine",
    "todocomments",
    "comment",
    "onedark",
    "mason",
    "lsp.configs"
}

for _, file in ipairs(files) do
    require("khalidbelhadj." .. file)
end
