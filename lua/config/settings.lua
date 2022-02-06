-- General settings

-- Set options
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "UTF-8"
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.signcolumn = "number"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.incsearch = true
vim.o.hidden = true
vim.o.textwidth = 92
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.wrap = false
vim.o.foldenable = false
vim.g.python3_host_prog = "/usr/bin/python"
vim.o.splitright = true

-- Autoformat
vim.api.nvim_set_keymap("n", "<leader>af", ":Autoformat<CR>", {})
vim.g.formatdef_latexindent = "'latexindent -'"
-- vim.g.formatdef_lua = "'stylua -f ~/.config/nvim/stylua.toml'"

-- Slime
vim.g.slime_target = "tmux"
-- vim.g.slime_target = "vimterminal"
-- vim.g.slime_target = "x11"

-- -- Command mode
-- WhichKey.register({
--     ["<C-a>"] = { "<Home>", "Home" },
--     ["<C-e>"] = { "<End>", "End" },
--     ["<C-p>"] = { "<Up>", "Up" },
--     ["<C-n>"] = { "<Down>", "Down" },
--     ["<C-b>"] = { "<Left>", "Left" },
--     ["<C-f>"] = { "<Right>", "Right" },
--     ["<M-b>"] = { "<S-left>", "Word left" },
--     ["<M-f>"] = { "<S-Right>", "Word right" },
-- }, { mode = "c", noremap = true })

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
vim.api.nvim_set_keymap("", "<F3>", ":NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap("", "<F2>", ":NvimTreeFindFileToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<C-o>", "o<Esc>", {})

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
-- vim.api.nvim_set_keymap("n", "<leader>v", ":edit $MYVIMRC<CR>", {})
