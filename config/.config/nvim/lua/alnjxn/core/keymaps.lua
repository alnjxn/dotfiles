-- map leaders first
vim.g.mapleader = " "

-- key mappings
vim.keymap.set("n", "<Space>", ":nohlsearch<Bar>:echo<CR>", { desc = "Clear search highlights" })
vim.keymap.set("v", "<", "<gv", { desc = "Align blocks of text and keep them selected" })
vim.keymap.set("v", ">", ">gv", { desc = "Align blocks of text and keep them selected" })

-- bufferline key mappings
vim.keymap.set("n", "<leader>gb", "<cmd>BufferLinePick<CR>", { desc = "pick buffer" })

-- buffer key mappings
vim.keymap.set("n", "<leader>n", ":enew<CR>", { desc = "open new buffer" })
vim.keymap.set("n", "<leader>x", ":bp <BAR> bd #<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>.", ":bnext<CR>", { desc = "goto next buffer" })
vim.keymap.set("n", "<leader>,", ":bprevious<CR>", { desc = "goto previous buffer" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

