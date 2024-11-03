require("nvchad.mappings")

local map = vim.keymap.set

map("n", "<leader><leader>", "<cmd> w <cr>", { desc = "Save file" })

-- DAP
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Toggle breakpoint" })
map("n", "<F5>", "<cmd> DapContinue <cr>", { desc = "Start or resume debugging" })
map("n", "<F10>", "<cmd> DapStepOver <cr>", { desc = "Step over" })
map("n", "<F11>", "<cmd> DapStepInto <cr>", { desc = "Step into" })
map("n", "<F12>", "<cmd> DapStepOut <cr>", { desc = "Step out" })
