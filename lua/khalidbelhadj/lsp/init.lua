local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("khalidbelhadj.lsp.configs")
require("khalidbelhadj.lsp.handlers").setup()
require("khalidbelhadj.lsp.null-ls")
