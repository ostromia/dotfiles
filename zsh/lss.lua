local lfs = require("lfs")

local folders = {}
local files = {}

local colors = {
    blue = "\27[34m",
    white = "\27[37m",
    reset = "\27[0m"
}

for item in lfs.dir(".") do
    if item ~= "." and item ~= ".." then
        local attr = lfs.attributes(item)
        if attr.mode == "directory" then
            table.insert(folders, item)
        else
            table.insert(files, item)
        end
    end
end

table.sort(folders)
table.sort(files, function(a, b)
    local extA = a:match("%.([^%.]+)$") or ""
    local extB = b:match("%.([^%.]+)$") or ""
    if extA == extB then
        return a < b
    end
    return extA < extB
end)

for _, f in ipairs(folders) do
    print(colors.blue .. f .. colors.reset)
end

for _, f in ipairs(files) do
    print(colors.white .. f .. colors.reset)
end
