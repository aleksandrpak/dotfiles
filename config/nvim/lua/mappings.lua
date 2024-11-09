require("nvchad.mappings")

local map = vim.keymap.set
local utils = require("configs.utils")

map("n", "<leader><leader>", "<cmd> w <cr>", { desc = "Save file" })
map("n", "<C-]>", "<cmd> bnext <cr>", { desc = "Next buffer" })
map("n", "<C-p>", "<cmd> bprevious <cr>", { desc = "Previous buffer" })

-- Diffview
map("n", "<leader>gf", function()
    local diffview = require("diffview")
    local lib = require("diffview.lib")
    local actions = require("diffview.actions")
    local view = lib.get_current_view()
    if view then
        diffview.close()
    else
        diffview.open()
        actions.toggle_files()
    end
    require("diffview.actions").toggle_files()
end, { desc = "Show files diff" })

if not utils.at_google() then
    -- DAP
    map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Toggle breakpoint" })
    map("n", "<F5>", "<cmd> DapContinue <cr>", { desc = "Start or resume debugging" })
    map("n", "<F10>", "<cmd> DapStepOver <cr>", { desc = "Step over" })
    map("n", "<F11>", "<cmd> DapStepInto <cr>", { desc = "Step into" })
    map("n", "<F12>", "<cmd> DapStepOut <cr>", { desc = "Step out" })
end
