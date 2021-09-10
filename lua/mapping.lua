local g = vim.g
local map = vim.api.nvim_set_keymap

g.mapleader = ' '
g.maplocalleader = ','

local function telescope_mapping()
	local options = { noremap = true, silent = true, nowait = true }
	-- List all the diagnostics
  map('n', '<leader>a', ':<C-u>Telescope lsp_document_diagnostics<cr>', options)
  -- find symbol for current document.
  map('n', '<leader>o', ':<C-u>Telescope lsp_document_symbols<cr>', options)
  -- List the files via FZF
  map('n', '<leader><leader>', ':<C-u>Telescope find_files<cr>', options)
  -- Fuzzy search for helptags
  map('n', '<leader>h', ':<C-u>Telescope help_tags<cr>', options)
  -- Find file using grepping keywords
  map('n', '<leader>/', ':<C-u>Telescope live_grep<cr>', options)
  -- list all available branches
  map('n', '<leader>gb', ':<C-u>Telescope git_branches<cr>', options)
  -- list all available branches
  map('n', '<leader>gs', ':<C-u>Telescope git_stashes<cr>', options)
  -- list all the opened buffers
  map('n', '<leader>gs', ':<C-u>Telescope git_buffers<cr>', options)
end

local function popular_mapping()
	local options = { noremap = true, silent = true}
  map('i', 'jk', '<Esc>', options)
  map('i', 'JK', '<Esc>', options)
  -- making Y be just like C , D
  map('n', 'Y', 'y$', options)
  --[[ keeping the cursor centered when doing things
  --like moving to next/previous line
	--]]
  map('n', 'N', 'Nzz', options)
  map('n', 'n', 'nzz', options)
  map('n', 'J', 'mzJ`z`', options)
  -- adds undo sequence in insertmode for easier undo
	local sequences = {',', '.', '(', '[', '{', '_'}
	for _,v in ipairs(sequences) do
		map('i', v, v ..'<c-g>u', options)
	end
  -- make jumplist add those lines that we jump relatively
	map('n', 'k', '(v:count > 5 ? "m`" . v:count: "") . "k"', { noremap = true, expr = true })
	map('n', 'j', '(v:count > 5 ? "m`" . v:count: "") . "j"', { noremap = true, expr = true })
  -- make current/visual selelcted line[s] move in visual mode
	map('v', 'K', ':m \'<-2<CR>gv=gv' , options)
	map('v', 'J', ':m \'>+1<CR>gv=gv' , options)
  -- in normal mode
	map('n', '<leader>j', ':m .+1<CR>==' , options)
	map('n', '<leader>k', ':m .-2<CR>==' , options)
	-- do not make visual selection disappear
	map('v', '>', '>gv' , options)
	map('v', '<', '<gv' , options)
end

local function application_switch()
	local options = {silent = true, nowait = true, noremap = true}
	map('n', '<leader>sl', '<cmd>!open /Applications/Slack.app<CR>', options)
	map('n', '<leader>br', '<cmd>!open /Applications/Brave Browser.app<CR>', options)
end

local function my_mappings()
	local options = { silent = true, nowait = true }
	-- toggle list visibility.
	map('n', '<leader>zl', '<cmd>set list!<CR', options)
  -- Open terminal
	map('n', '<leader>t', '<cmd>10split term://zsh<CR>', options)
  -- toggle Explorer with Lexplorer
	map('n', '<leader>e', '<cmd>Lexplore<CR>',options)
  -- Delete the current buffer
	map('n', '<leader>bd', '<cmd>bd<CR>', options)
  -- Go to the previous buffer
	map('n', '<leader>bd', '<cmd>bp<CR>', options)
  -- Go to the next buffer
	map('n', '<leader>b>', '<cmd>bpnCR>', options)
  -- Write the buffer content to file
	map('n', '<leader>fs', '<cmd>w<CR>', options)
	-- Close the current tab.
	map('n', '<leader>tq', '<cmd>tabclose<CR>', options)
	-- open diffview
	map('n', '<leader>gg', '<cmd>DiffviewOpen<CR>', options)
end


telescope_mapping()
popular_mapping()
application_switch()
my_mappings()
