-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")
require("colorloaders/colors")
require("config/whichkey")
require("config/spectre")
require("config/coc")
require("config/julia")
require("config/latex")
require("config/markdown")

-- Set options
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "UTF-8"
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.mouse = "a"
vim.o.incsearch = true
vim.o.hidden = true
vim.o.textwidth = 92
vim.o.signcolumn = "number"
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.wrap = false
vim.o.foldenable = false

vim.g.python3_host_prog = "/usr/bin/python"
vim.g.formatdef_latexindent = "'latexindent -'"
vim.api.nvim_set_keymap("n", "<leader>af", ":Autoformat<CR>", {})

-- Slime
vim.g.slime_target = "tmux"
-- vim.g.slime_target = "vimterminal"
-- vim.g.slime_target = "x11"

-- Airline
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_powerline_fonts = 0

-- Command mode
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-p>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-n>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-b>", "<S-Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-f>", "<S-Right>", { noremap = true })

-- Keybindings
-- vim.api.nvim_set_keymap("", "<F3>", ":NERDTreeToggle<CR>", {})
-- vim.api.nvim_set_keymap("", "<F2>", ":NERDTreeFind<CR>", {})
vim.api.nvim_set_keymap("", "<F3>", ":NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap("", "<F2>", ":NvimTreeFindFileToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>v", ":edit $MYVIMRC<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>r", ":source $MYVIMRC<CR>", {})
vim.api.nvim_set_keymap("n", "<C-o>", "o<Esc>", {})
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>e", ":Telescope live_grep<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>w", ":Telescope grep_string<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>h", ":Telescope help_tags<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>c", ":bd<CR>", {})
vim.api.nvim_set_keymap("n", "<C-j>", ":bprev<CR>", {})
vim.api.nvim_set_keymap("n", "<C-k>", ":bnext<CR>", {})
