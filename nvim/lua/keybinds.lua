vim.g.mapleader = ' ' -- leader is Space
vim.g.maplocalleader = "\\" -- localleader is \

-- system clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

-- page up and down and center
vim.keymap.set({'n'}, '<C-b>', '<PageUp>zz')
vim.keymap.set({'n'}, '<C-f>', '<PageDown>zz')

-- buffer navigation
vim.keymap.set('n', '<C-n>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>bprev<cr>')

-- navigating splits
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<cr>')
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<cr>')

-- oil keybinds
vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>')

-- telescope keybinds
local tsbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>m', function()
    tsbuiltin.buffers({sort_mru = true, ignore_current_buffer = true})
end)

-- lsp keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- You can search each function in the help page.
        -- For example :help vim.lsp.buf.hover()

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap({'n', 'x'}, '<F3>',
               '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

        bufmap({'n', 'x'}, '<leader>ca',
               '<cmd>lua vim.lsp.buf.code_action()<cr>')

        -- if using Neovim v0.8 uncomment this
        -- bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    end
})
