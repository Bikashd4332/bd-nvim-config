local nvim_lsp = require('lspconfig')

local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
  javascript = "eslint",
  javascriptreact = "eslint"
}

local linters = {
  eslint = {
    sourceName =  "eslint",
    commandName = "eslint_d",
    rootPatters = {".eslintrc.js", "package.json"},
    debounde = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity",
    },
    securities = { [2] = "error", [1] = "warning" }
  }
}

local formatters = {
  prettier = {
    command = "prettier",
    args = {
      "--stdin-filepath",
      "%filepath"
    }
  }
}

local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier",
  javascript = "prettier",
  javascriptreact = "prettier",
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Helpers
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'go', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'K', '<leader>,r vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>,k', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>,c', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  -- See :help lsp_signature.nvim
  require'lsp_signature'.on_attach({
    bind = true,
    handler_opts = {
      border = "single"
    }
  })
end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      filetypes = filetypes,
      linters = linters,
      formatters = formatters,
      formatFiletypes = formatFiletypes
    }
  }
end

-- Use telescope for few of fuzzy finding symbols
local telescope = require('telescope')
telescope.load_extension('lsp_handlers')

-- Use nvim-compe for lsp auto completion
require'compe_config'

