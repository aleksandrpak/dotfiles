vim.filetype.add({
    extension = {
        bean = "beancount",
    },
})

-- Symlink detecion
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.*.symlink",
    callback = function(ev)
        local filename = vim.fn.expand(ev.match)
        local base_filetype = filename:match("%.(%w+)%.symlink$")

        if base_filetype then
            vim.bo[ev.buf].filetype = base_filetype
        end
    end,
    desc = "Set correct filetype for .symlink files",
})
