return {
    {
        "toppair/peek.nvim",
        enabled = false,
        build = "deno task --quiet build:fast",
        lazy = false,
        opts = {
            auto_load = true, -- whether to automatically load preview when
            -- entering another markdown buffer
            close_on_bdelete = true, -- close preview window on buffer delete
            syntax = true, -- enable syntax highlighting, affects performance
            theme = "dark", -- 'dark' or 'light'
            update_on_change = true,
            app = "browser", -- 'webview', 'browser', string or a table of strings explained below
            filetype = { "markdown" }, -- list of filetypes to recognize as markdown
            -- relevant if update_on_change is true
            throttle_at = 200000, -- start throttling when file exceeds this amount of bytes in size
            throttle_time = "auto", -- minimum amount of time in milliseconds that has to pass before starting new render
        },
    },

    {
        "Zeioth/markmap.nvim",
        enabled = false,
        build = "yarn global add markmap-cli",
        cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
        opts = {
            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
            hide_toolbar = false, -- (default)
            grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
        },
        -- config = function(_, opts)
        --     require("markmap").setup(opts)
        -- end,
    },

    {
        -- "davidgranstrom/nvim-markdown-preview",
        dir = "$HOME/projects/nvim-markdown-preview",
        enabled = false,
        -- event = "VeryLazy",
        ft = { "markdown" },
        config = function()
            vim.g.nvim_markdown_preview_format = "markdown"
            -- vim.g.nvim_markdown_preview_format = "gfm"
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        lazy = false,
        ft = { "markdown" },
        config = function()
            -- set to 1, nvim will open the preview window after entering the Markdown buffer
            -- default: 0
            vim.cmd([[let g:mkdp_auto_start = 1]])

            -- set to 1, the nvim will auto close current preview window when changing
            -- from Markdown buffer to another buffer
            -- default: 1
            vim.cmd([[let g:mkdp_auto_close = 0]])

            -- set to 1, Vim will refresh Markdown when saving the buffer or
            -- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
            -- move the cursor
            -- default: 0
            vim.cmd([[let g:mkdp_refresh_slow = 0]])

            -- set to 1, the MarkdownPreview command can be used for all files,
            -- by default it can be use in Markdown files only
            -- default: 0
            vim.cmd([[let g:mkdp_command_for_global = 0]])

            -- set to 1, the preview server is available to others in your network.
            -- By default, the server listens on localhost (127.0.0.1)
            -- default: 0
            vim.cmd([[let g:mkdp_open_to_the_world = 0]])

            -- use custom IP to open preview page.
            -- Useful when you work in remote Vim and preview on local browser.
            -- For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
            -- default empty
            vim.cmd([[let g:mkdp_open_ip = '']])

            -- specify browser to open preview page
            -- for path with space
            -- valid: `/path/with\ space/xxx`
            -- invalid: `/path/with\\ space/xxx`
            -- default: ''
            vim.cmd([[let g:mkdp_browser = '']])

            -- set to 1, echo preview page URL in command line when opening preview page
            -- default is 0
            vim.cmd([[let g:mkdp_echo_preview_url = 0]])

            -- a custom Vim function name to open preview page
            -- this function will receive URL as param
            -- default is empty
            vim.cmd([[let g:mkdp_browserfunc = '']])

            -- options for Markdown rendering
            -- mkit: markdown-it options for rendering
            -- katex: KaTeX options for math
            -- uml: markdown-it-plantuml options
            -- maid: mermaid options
            -- disable_sync_scroll: whether to disable sync scroll, default 0
            -- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
            --   middle: means the cursor position is always at the middle of the preview page
            --   top: means the Vim top viewport always shows up at the top of the preview page
            --   relative: means the cursor position is always at relative positon of the preview page
            -- hide_yaml_meta: whether to hide YAML metadata, default is 1
            -- sequence_diagrams: js-sequence-diagrams options
            -- content_editable: if enable content editable for preview page, default: v:false
            -- disable_filename: if disable filename header for preview page, default: 0
            vim.cmd([[
        let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 1,
            \ 'toc': {}
            \ }
        ]])

            -- use a custom Markdown style. Must be an absolute path
            -- like '/Users/username/markdown.css' or expand('~/markdown.css')
            vim.cmd([[let g:mkdp_markdown_css = '']])

            -- use a custom highlight style. Must be an absolute path
            -- like '/Users/username/highlight.css' or expand('~/highlight.css')
            vim.cmd([[let g:mkdp_highlight_css = '']])

            -- use a custom port to start server or empty for random
            vim.cmd([[let g:mkdp_port = '']])

            -- preview page title
            -- ${name} will be replace with the file name
            vim.cmd([[let g:mkdp_page_title = '「${name}」']])

            -- -- use a custom location for images
            -- vim.cmd([[let g:mkdp_images_path = /home/syver/.markdown_images]])

            -- recognized filetypes
            -- these filetypes will have MarkdownPreview... commands
            vim.cmd("let g:mkdp_filetypes = ['markdown']")

            -- set default theme (dark or light)
            -- By default the theme is defined according to the preferences of the system
            vim.cmd([[let g:mkdp_theme = 'dark']])

            -- combine preview window
            -- default: 0
            -- if enable it will reuse previous opened preview window when you preview markdown file.
            -- ensure to set let g:mkdp_auto_close = 0 if you have enable this option
            vim.cmd([[let g:mkdp_combine_preview = 0]])
        end,
    },
}
