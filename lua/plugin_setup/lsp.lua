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


local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end


require("lspconfig").zls.setup {

    on_new_config = function (new_config, root_dir)
        local zls_path = root_dir .. "/zls.json"

        if file_exists(zls_path)
        then new_config.cmd = {"zls", "--config-path", zls_path}
        else new_config.cmd = {"zls"}
        end
    end
}


local cmp = require("cmp")
local luasnip = require("luasnip");

cmp.setup {
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'async_path' },
    }, {
        {name = 'buffer'}
    }),
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end),

        ["<C-l>"] = cmp.mapping(function (fallback)
            if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s", "c", }),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    }
}

cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { {name = 'buffer'}}
})

-- fix completions in command mode
vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })
