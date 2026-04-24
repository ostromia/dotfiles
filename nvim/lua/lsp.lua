local M = {}

local servers = {
    python = { "ruff", "ty" },
}

local state = false

local function off(names)
    for _, name in ipairs(names) do
        for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
            client:stop()
        end
    end
end

local function on(names)
    for _, name in ipairs(names) do
        vim.lsp.enable(name)
    end
end

function M.toggle()
    local filetype = vim.bo.filetype
    local names = servers[filetype]
    if not names then return end
    if state then
        off(names)
    else
        on(names)
    end
    state = not state
end

return M
