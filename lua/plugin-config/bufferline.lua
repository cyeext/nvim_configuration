local status, bufferline = pcall(require, "bufferline")
if (not status) then
	return
end

vim.opt.termguicolors = true

require("bufferline").setup()

--按键映射
--nnoremap <silent> gb :BufferLinePick<CR>
vim.api.nvim_set_keymap("n", "gb", "<Cmd>BufferLinePick<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gc", "<Cmd>BufferLinePickClose<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", {noremap = true, silent = true})

--vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})



