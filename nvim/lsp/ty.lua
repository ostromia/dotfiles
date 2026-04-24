---@type vim.lsp.Config
local path = vim.fn.getcwd() .. "/.venv/bin/ty"
local cmd = vim.fn.executable(path) == 1 and { path, "server" } or { "ty", "server" }

return {
    cmd = cmd,
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }
}
