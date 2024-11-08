return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = 'warmer'
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'onedark'
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = {
                    {
                        require('lazy.status').updates,
                        cond = require('lazy.status').has_updates,
                        color = { fg = '#ff9e64' },
                    },
                    'location'
                },
                lualine_y = { 'progress' },
                lualine_z = { 'fileformat', 'encoding', 'filetype' }
            }
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup { scope = { highlight = highlight } }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    },
    { "tpope/vim-fugitive" },
    { "HiPhish/rainbow-delimiters.nvim", dependencies = "nvim-treesitter/nvim-treesitter" },
    { "RRethy/nvim-treesitter-endwise" },
    { "RRethy/vim-illuminate" },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "all",
                sync_install = false,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                endwise = {
                    enable = true,
                },
            }
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.api.nvim_create_autocmd({'VimEnter'}, {
                callback = function(data)
                    -- buffer is a real file on the disk
                    local real_file = vim.fn.filereadable(data.file) == 1

                    -- buffer is a [No Name]
                    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

                    if not real_file and not no_name then
                        return
                    end

                    -- open the tree, find the file but don't focus it
                    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
                end
            })
            -- Make :bd and :q behave as usual when tree is visible
            vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
                nested = false,
                callback = function(e)
                    local tree = require('nvim-tree.api').tree

                    -- Nothing to do if tree is not opened
                    if not tree.is_visible() then
                        return
                    end

                    -- How many focusable windows do we have? (excluding e.g. incline status window)
                    local winCount = 0
                    for _,winId in ipairs(vim.api.nvim_list_wins()) do
                        if vim.api.nvim_win_get_config(winId).focusable then
                            winCount = winCount + 1
                        end
                    end

                    -- We want to quit and only one window besides tree is left
                    if e.event == 'QuitPre' and winCount == 2 then
                        vim.api.nvim_cmd({cmd = 'qall', bang = true}, {})
                    end

                    -- :bd was probably issued an only tree window is left
                    -- Behave as if tree was closed (see `:h :bd`)
                    if e.event == 'BufEnter' and winCount == 1 then
                        -- Required to avoid "Vim:E444: Cannot close last window"
                        vim.defer_fn(function()
                            -- close nvim-tree: will go to the last buffer used before closing
                            tree.toggle({find_file = true, focus = true})
                            -- re-open nivm-tree
                            tree.toggle({find_file = true, focus = false})
                        end, 10)
                    end
                end
            })
            require("nvim-tree").setup {}
        end
    },
    {
        "lambdalisue/vim-suda",
        init = function()
            vim.g.suda_smart_edit = 1
        end
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
    },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "brenoprata10/nvim-highlight-colors", opts = {} },
    {
        "monaqa/dial.nvim",
        keys = {
            { "<C-a>", "<Plug>(dial-increment)", mode = { "n", "v" } },
            { "<C-x>", "<Plug>(dial-decrement)", mode = { "n", "v" } },
            { "g<C-a>", "g<Plug>(dial-increment)", mode = { "n", "v" } },
            { "g<C-x>", "g<Plug>(dial-decrement)", mode = { "n", "v" } },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "ixru/nvim-markdown",
        init = function()
            vim.g.vim_markdown_frontmatter = 1
        end
    },
    {
        "Wansmer/treesj",
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {},
    }
}
