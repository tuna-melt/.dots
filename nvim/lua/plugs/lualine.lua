Plug 'nvim-lualine/lualine.nvim'

vim.loaded.start_lualine = function()
    require('lualine').setup{
        options = {
            theme = vim.luatheme == nil and vim.env.THEME or vim.luatheme
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'FugitiveHead'},
            lualine_c = {},
            lualine_x = {'filename'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        }
    }
end
