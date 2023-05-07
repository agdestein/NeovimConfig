return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup({
            -- background_colour = "#000000",
            background_colour = "#ffffff",
            render = "minimal",
            animation = "fade",
            -- stages = "fade_in_slide_out",
            -- stages = "static",
            stages = "fade",
            -- level = nil,
            top_down = true,
        })
        vim.notify = notify
    end,
}
