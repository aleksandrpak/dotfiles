local M = {}

function M.at_google()
    -- Check if the OS is Linux
    local is_linux = vim.loop.os_uname().sysname == "Linux"
    -- Check if "gcert" binary exists in the PATH
    local has_gcert = vim.fn.executable("gcert") == 1
    return is_linux and has_gcert
end

function M.google_path()
    -- Get the current file path
    local filepath = vim.fn.expand("%:p")

    -- Ensure the path contains '/google3/' as an exact directory (not part of another name)
    return filepath:match("/google3/")
end

return M
