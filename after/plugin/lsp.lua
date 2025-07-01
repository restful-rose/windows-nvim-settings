local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    -- Configure diagnostics for PowerShell LSP
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        virtual_lines = false,
        underline = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'solid', -- 'none', 'rounded', 'bold', single, solid, double
            source = false, -- include diagnostic source in message
            header = '',
            prefix = '',
        },
    })
    -- Add keymap for showing error message
    vim.keymap.set('n', 'gK', vim.diagnostic.open_float)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

local OnAttach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<Leader>td', vim.lsp.buf.type_definition, bufopts)

end

local homeDirectory = os.getenv('HOME')
if homeDirectory == nil then
    homeDirectory = os.getenv('USERPROFILE')
end

-- The bundle is where PowerShell Editor Services was installed
local bundlePath = homeDirectory .. '\\AppData\\Local\\nvim\\LSPs\\PowerShellEditorServices'

require('lspconfig')['powershell_es'].setup {
    bundle_path = bundlePath,
    on_attach = OnAttach,
    settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } }
}

require('lspconfig').lua_ls.setup({})
