--
--   ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--  ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--  ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--  ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
--  ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
--   ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
--
--  basic options and settings

local options = {
    termguicolors = true,
    backup = false, -- Creates a backup file
    clipboard = "unnamedplus", -- Allows neovim to access the system clipboard
    cmdheight = 1, -- More space in the neovim command line for displaying messages (changed from 2)
    completeopt = { "menuone", "noselect" }, -- Mostly just for cmp
    conceallevel = 0, -- So that `` is visible in markdown files
    fileencoding = "utf-8", -- The encoding written to a file
    hlsearch = true, -- Highlight all matches on previous search pattern
    ignorecase = true, -- Ignore case in search patterns
    mouse = "a", -- Allow the mouse to be used in neovim
    pumheight = 10, -- Pop up menu height
    showmode = false, -- We don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- Always show tabs
    smartcase = true, -- Smart case
    smartindent = true, -- Make indenting smarter again
    splitbelow = true, -- Force all horizontal splits to go below current window
    splitright = true, -- Force all vertical splits to go to the right of current window
    swapfile = false, -- Creates a swapfile
    timeoutlen = 100, -- Time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- Enable persistent undo
    updatetime = 300, -- Faster completion (4000ms default)
    writebackup = false, -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- Convert tabs to spaces
    shiftwidth = 4, -- The number of spaces inserted for each indentation
    tabstop = 4, -- Insert 2 spaces for a tab
    cursorline = true, -- Highlight the current line
    cursorcolumn = false, -- Highlight current columns
    number = true, -- Set numbered lines
    relativenumber = false, -- Set relative numbered lines
    numberwidth = 4, -- Set number column width to 2 {default 4}
    signcolumn = "yes", -- Always show the sign column, otherwise it would shift the text each time
    wrap = true, -- Display lines as one long line
    scrolloff = 8, -- Start scrolling 8 lines before end
    sidescrolloff = 8, -- Start scrolling 8 columns before end
    guifont = "monospace:h17", -- The font used in graphical neovim applications
    autochdir = true,
    laststatus = 3,
}

-- Setting all the above options
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l" -- Cursor goes to the beggining of next line when reached the end
vim.opt.fillchars = vim.opt.fillchars + 'eob: ' -- Replacing end of buffer ~ with empty space


-- Autocommand to format on save
local formatOnSave = false
if formatOnSave then
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

-- Archived options
-- Autocommand to set laststatus=3, doesnt seem to work normally
-- local group = vim.api.nvim_create_augroup("Setting last status", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", { command = "set laststatus=3", group = group })

-- Remove command bar when not in command mode
-- vim.o.ch = 0
