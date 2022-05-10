local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')

-- enable null-ls integration (optional)
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.code_actions.shellcheck,
    },
})

-- make sure to only run this once!
nvim_lsp.tsserver.setup {
	-- Only needed for inlayHints. Merge this table with your settings or copy
	-- it from the source if you want to add your own init_options.
	init_options = require("nvim-lsp-ts-utils").init_options,
	--
	on_attach = function(client, bufnr)
		-- disable tsserver formatting if you plan on formatting via null-ls
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup {
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,

			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers indicate higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,

			-- eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = "eslint_d",
			eslint_enable_diagnostics = true,
			eslint_opts = {},

			-- formatting
			enable_formatting = true,
			formatter = "eslint_d",
			formatter_opts = { "--fix" },

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},

			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = "Comment",
		}

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = { silent = true }
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'go', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>,a', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			'n',
			'<leader>,k',
			'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
			opts
		)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>,c', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	end
}

-- Use lua language server
require'lua_lang_server';

-- Use telescope for few of fuzzy finding symbols
local telescope = require('telescope')
telescope.load_extension('lsp_handlers')

-- Use nvim-compe for lsp auto completion
require'compe_config'
-- require'lsp_diagnostics'

