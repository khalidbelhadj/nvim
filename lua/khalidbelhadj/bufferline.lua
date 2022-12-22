--
--  ██████╗ ██╗   ██╗███████╗███████╗███████╗██████╗ ██╗     ██╗███╗   ██╗███████╗
--  ██╔══██╗██║   ██║██╔════╝██╔════╝██╔════╝██╔══██╗██║     ██║████╗  ██║██╔════╝
--  ██████╔╝██║   ██║█████╗  █████╗  █████╗  ██████╔╝██║     ██║██╔██╗ ██║█████╗
--  ██╔══██╗██║   ██║██╔══╝  ██╔══╝  ██╔══╝  ██╔══██╗██║     ██║██║╚██╗██║██╔══╝
--  ██████╔╝╚██████╔╝██║     ██║     ███████╗██║  ██║███████╗██║██║ ╚████║███████╗
--  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
--
--  Shows active buffers as tabs on the top

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count)
            return "(" .. count .. ")"
        end,
        offsets = {
            {
                filetype = "NvimTree", text = "File Explorer", padding = 1
            },
            {
                filetype = "toggleterm", text = "Terminal"
            }
        },
    },

}
