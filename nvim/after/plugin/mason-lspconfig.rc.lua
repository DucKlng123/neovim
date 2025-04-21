require("mason").setup({
    pip = {
        skip_python_version_check = true
    },
})
require("mason-lspconfig").setup({
    ensure_installed = {"clangd",},
})
