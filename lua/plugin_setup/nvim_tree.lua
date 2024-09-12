
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")

local sortfn = function(a, b)
    if a.type == "directory" then
        if b.type == "directory" then
            return a.name < b.name
        else
            return true;
        end
    elseif b.type == "directory" then
        return false;
    elseif (a.extension ~= b.extension) then
        return a.extension < b.extension
    else
        return a.name < b.name
    end
end

-- empty setup using defaults
require("nvim-tree").setup {
    sort = {
        sorter = -- "extension",
            function(nodes)
                table.sort(nodes, sortfn)
            end
    },
}


