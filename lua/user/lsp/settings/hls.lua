return {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell" },
    settings = {
      haskell = {
        formattingProvider = "ormolu"
      }
    },
    single_file_support = true,
}
