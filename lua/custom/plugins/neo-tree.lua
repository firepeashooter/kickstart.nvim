return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- optional for icons
            "MunifTanjim/nui.nvim",
        },
        config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = "open_default",
            },
            window = {
                width = 35,
                mappings = {
                    ["<cr>"] = "open",           -- open file in current window
                    ["t"] = "open_tabnew",       -- open file in new tab
                    ["v"] = "open_vsplit",       -- optional: vertical split
                },
            },
            -- Auto-close Neo-tree when a file is opened
            event_handlers = {
                {
                    event = "file_open_requested", -- triggers whenever a file is opened
                    handler = function(_)
                    require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })
        end,
    },
}
