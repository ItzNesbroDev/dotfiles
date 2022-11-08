local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

keymap("n", "<leader>h", ":nohl<Return>", opts)
keymap("n", "te", ":tabedit<Return>", opts)

keymap("n", "Q", ":bdelete<Return>", opts)
keymap("n", "<leader>q", ":q<Return>", opts)

keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>Q', vim.diagnostic.setloclist, opts)

keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

keymap('n', 'sw', '<C-w>w', opts)
keymap('', 'sh', '<C-w>h', opts)
keymap('', 'sk', '<C-w>k', opts)
keymap('', 'sj', '<C-w>j', opts)
keymap('', 'sl', '<C-w>l', opts)
