-- diagnostic bindings, available even without lsp
vim.keymap.set('n', '<leader>vd', "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set('n', "dn", "<cmd>lua vim.diagnostic.goto_next()<cr>");
vim.keymap.set('n', "dN", "<cmd>lua vim.diagnostic.got_prev()<cr>");

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<cr>")
        vim.keymap.set('n', "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, 'fmt', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    require('lspconfig')[server].setup {
        capabilities = lsp_capabilities
    }
end

require("mason").setup {}
require("mason-lspconfig").setup {
    ensuer_installed = {},
    handlers = {
        default_setup
    },
}

local cmp = require("cmp")

cmp.setup {
    sources = { { name = 'nvim_lsp' } },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    }
}
