vim.o.autoindent = true
vim.o.autoread = true
vim.o.breakindent = true
vim.o.ch = 0
vim.o.cindent = true
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = false
vim.o.encoding = "UTF-8"
vim.o.expandtab = true
vim.o.foldenable = false
vim.o.hidden = true
vim.o.incsearch = true
vim.o.linebreak = true
vim.o.ls = 0
vim.o.mouse = "a"
vim.o.number = false
-- vim.o.numberwidth = 2
vim.o.relativenumber = false
vim.o.shiftwidth = 4
vim.o.showbreak = "↪ "
vim.o.signcolumn = "no"
vim.o.smartindent = true
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.tabstop = 4
-- vim.o.textwidth = 92
vim.o.timeoutlen = 500
vim.o.title = true
vim.o.updatetime = 300
-- vim.o.winblend = 10
vim.o.wrap = false

vim.g.formatdef_latexindent = "'latexindent -'"
vim.g.formatdef_python = "black"
vim.g.loaded_perl_provider = false
vim.g.python3_host_prog = "/usr/bin/python"

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
