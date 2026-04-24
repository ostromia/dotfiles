require("tree-sitter-manager").setup({
    ensure_installed = { "python" },
    highlight = { "python" }
})

if not pcall(vim.treesitter.language.inspect, "python") then return end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.treesitter.start()
    end
})

