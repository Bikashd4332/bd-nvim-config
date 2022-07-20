local split = vim.fn.split

local sumneko_bin_path = "/opt/homebrew/bin/lua-language-server"

local runtime_path = split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local function on_attach (_, bufnr)
	-- Helpers
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'go', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>,r', 'vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(
    'n',
    '<leader>,k',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    opts
  )
  buf_set_keymap('n', '<leader>,f', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)
  buf_set_keymap('n', '<leader>,c', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
end

-- local on_attach = function

require'lspconfig'.sumneko_lua.setup {
  cmd = { sumneko_bin_path },
	on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        --[[
        -- Tell the language server which version of lua you're using.
        -- (Most likely LuaJIT in case of Neovim)
        --]]
        version = "LuaJIT",
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize that vim is our global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the language server aware of the neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemtery = {
        enable = false,
      }
    }
  }
}
