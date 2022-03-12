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
    nnoremap <silent> K :call <SID>show_documentation()<CR>
]])

-- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- vim.api.nvim_set_keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {})

-- vim.cmd([[
--     function! StatusDiagnostic() abort
--         let info = get(b:, 'coc_diagnostic_info', {})
--         if empty(info) | return '' | endif
--         let msgs = []
--         if get(info, 'error', 0)
--             call add(msgs, 'E' . info['error'])
--         endif
--         if get(info, 'warning', 0)
--             call add(msgs, 'W' . info['warning'])
--         endif
--         return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
--     endfunction
-- ]])

WhichKey.register({
    name = "Coc",
    n = { "<Plug>(coc-rename)", "Rename symbol" },
    f = { "<Plug>(coc-format-selected)", "Format selection", mode = "v" },
    g = { ":call CocAction('format')<CR>", "Format document" },
    d = { "<Plug>(coc-definition)", "Go to definition" },
    r = { "<Plug>(coc-references)", "References" },
    t = { "<Plug>(coc-type-definition)", "Type definition" },
    i = { "<Plug>(coc-implementation)", "Implementation" },
    s = { ":CocDiagnostics<CR>", "Show diagnostics" },
}, { prefix = "<leader>o", noremap = true, silent = true })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
WhichKey.register({
    ["<CR>"] = {
        [[pumvisible() ? coc#_select_confirm(): '<C-g>u<CR><c-r>=coc#on_enter()<CR>']],
        "Select Coc proposal",
    },
    ["<C-space>"] = { "coc#refresh()", "Refresh completion" },
}, { mode = "i", expr = true, silent = true, noremap = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
WhichKey.register({
    ["[g"] = { "<Plug>(coc-diagnostic-prev)", "Previous Coc diagnostic" },
    ["]g"] = { "<Plug>(coc-diagnostic-next)", "Next Coc diagnostic" },
}, { mode = "n", silent = true, noremap = true })

-- Remap <C-n> and <C-p> for scroll float windows/popups.
WhichKey.register({
    ["<C-f>"] = { [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], "Scroll down" },
    ["<C-b>"] = { [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], "Scroll up" },
}, { mode = "n", expr = true, silent = true, noremap = true })

WhichKey.register({
    ["<C-f>"] = { [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]], "Scroll down" },
    ["<C-b>"] = { [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]], "Scroll up" },
}, { mode = "i", expr = true, silent = true, noremap = true })

WhichKey.register({
    ["<C-f>"] = { [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], "Scroll down" },
    ["<C-b>"] = { [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], "Scroll up" },
}, { mode = "v", noremap = true, silent = true, nowait = true, expr = true })
