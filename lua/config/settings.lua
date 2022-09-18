-- General settings

-- Set options
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "UTF-8"

vim.o.signcolumn = "no"
-- vim.o.signcolumn = "number"
-- vim.o.number = true
-- vim.o.relativenumber = true

vim.o.numberwidth = 2
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.incsearch = true
-- vim.o.cursorline = true
vim.o.hidden = true
-- vim.o.textwidth = 92
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.foldenable = false
vim.g.python3_host_prog = "/usr/bin/python"
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.o.winblend = 10
vim.o.autoread = true
vim.o.spell = true
vim.o.spelllang = "en_us"

vim.o.showbreak = "↪ "
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.wrap = false

-- vim.o.laststatus = 3
-- vim.cmd("set laststatus=3")

vim.g.loaded_perl_provider = false

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Format
vim.g.formatdef_latexindent = "'latexindent -'"
-- vim.g.formatdef_lua = "'stylua -f ~/.config/nvim/stylua.toml'"
vim.g.formatdef_python = "black"

local function reloadconfig()
    for name, _ in pairs(package.loaded) do
        if name:match("^config") then
            package.loaded[name] = nil
        end
    end
    package.loaded["colorloaders/colors"] = nil

    dofile(vim.env.MYVIMRC)
end

WhichKey.register({
    r = { reloadconfig, "Reload Neovim config" },
    e = { ":edit $MYVIMRC<CR>", "Edit Neovim config" },
}, { prefix = "<leader>q", noremap = true })
