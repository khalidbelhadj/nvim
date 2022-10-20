--
--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗    ████████╗██████╗ ███████╗███████╗
--  ████╗  ██║██║   ██║██║████╗ ████║    ╚══██╔══╝██╔══██╗██╔════╝██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║       ██║   ██████╔╝█████╗  █████╗
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██║   ██╔══██╗██╔══╝  ██╔══╝
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║       ██║   ██║  ██║███████╗███████╗
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝       ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
--
--  File tree

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- Autoclose nvim tree
local modifiedBufs = function(bufs)
    local t = 0
    for _, v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
            vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
            modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
            vim.cmd[[autocmd BufWritePre <buffer> lua Alpha]]
        end
    end
})
--
nvim_tree.setup {
    filters = {
        dotfiles = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        indent_markers = {
            enable = true
        },
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        height = 30,
        side = "left",
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
    },
    sort_by = "name"
}
