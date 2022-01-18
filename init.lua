require("plugins")
require("colorloaders/colors")
require("coc")

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
vim.o.wrap = false
vim.o.foldenable = false

-- Disable comment continuation
-- vim.opt.formatoptions:remove({"o"})

-- Command mode
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-p>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-n>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-b>", "<S-Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-f>", "<S-Right>", { noremap = true })

-- Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.mkdp_browser = "vimb"
vim.api.nvim_set_keymap("n", "gm", "<Plug>MarkdownPreviewToggle", {})
-- vim.g.mkdp_auto_start = 1
-- vim.g.mkdp_markdown_css = expand('~/.config/nvim/colorloaders/markdown.css')

-- Python path for autoformat
vim.g.python3_host_prog = "/usr/bin/python"
vim.g.formatdef_latexindent = "'latexindent -'"

vim.api.nvim_set_keymap("n", "<leader>af", ":Autoformat<CR>", {})

-- VimTeX
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = {
	options = {
		"-pdf",
		"-shell-escape",
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}

-- Slime
vim.g.slime_target = "tmux"
-- vim.g.slime_target = "vimterminal"
-- vim.g.slime_target = "x11"

vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Space>", "<Leader>", {})

-- NERDTree
vim.api.nvim_set_keymap("", "<F3>", ":NERDTreeToggle<CR>", {})
vim.api.nvim_set_keymap("", "<F2>", ":NERDTreeFind<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>v", ":edit $MYVIMRC<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>r", ":source $MYVIMRC<CR>", {})

vim.api.nvim_set_keymap("n", "<C-o>", "o<Esc>", {})

vim.api.nvim_set_keymap("n", "<leader>p", ":Files<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>w", ":Rg <C-r><C-w><CR>", {})

vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>c", ":bd<CR>", {})
vim.api.nvim_set_keymap("n", "<C-j>", ":bprev<CR>", {})
vim.api.nvim_set_keymap("n", "<C-k>", ":bnext<CR>", {})

-- Julia
vim.g.default_julia_version = "1.7"
vim.g.julia_cell_delimit_cells_by = "tags"
vim.api.nvim_set_keymap("n", "<leader>jc", ":JuliaCellExecuteCell<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>jx", ":JuliaCellExecuteCellJump<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>jj", ":JuliaCellNextCell<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>jk", ":JuliaCellPrevCell<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>jb", ":call julia#toggle_function_blockassign()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>jf", ":JuliaFormatterFormat<CR>", {})

-- :vim.cmd("nmap K :lua vim.lsp.buf.hover() <CR>")
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_powerline_fonts = 0
