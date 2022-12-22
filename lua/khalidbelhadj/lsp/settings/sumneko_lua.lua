return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- Recognising "vim" as a global variable
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
