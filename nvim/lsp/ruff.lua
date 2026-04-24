---@type vim.lsp.Config
local path = vim.fn.getcwd() .. "/.venv/bin/ruff"
local cmd = vim.fn.executable(path) == 1 and { path, "server" } or { "ruff", "server" }

return {
    cmd = cmd,
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".git" }
}
