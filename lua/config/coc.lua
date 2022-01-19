-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
vim.api.nvim_set_keymap(
	"i",
	"<expr> <cr>",
	[[pumvisible() ? coc#_select_confirm(): '<C-g>u<CR><c-r>=coc#on_enter()<CR>']],
	{ silent = true, noremap = true }
)

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation.
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Use K to show documentation in preview window.
vim.cmd([[
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    nnoremap <silent> K :call <SID>show_documentation()<CR>"
]])

-- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Symbol renaming.
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})

-- Formatting selected code.
vim.api.nvim_set_keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {})
vim.api.nvim_set_keymap("n", "<leader>f", "<Plug>(coc-format-selected)", {})

vim.api.nvim_set_keymap("n", "gf", ":call CocAction('format')<CR>", { silent = true })
