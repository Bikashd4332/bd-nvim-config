local map = vim.api.nvim_set_keymap
local nvim_set_var = vim.api.nvim_set_var

nvim_set_var('mapleader', ' ')
nvim_set_var('maplocalleader', ',')

local function telescope_mapping()
	local options = { noremap = true, silent = true, nowait = true }
	-- List all the diagnostics
  map('n', '<leader>a', ':<C-u>Telescope lsp_document_diagnostics<cr>', options)
  -- find symbol for current document.
  map('n', '<leader>o', ':<C-u>Telescope lsp_document_symbols<cr>', options)
  -- List the files via FZF
  map('n', '<leader><leader>', ':<C-u>Telescope git_files<cr>', options)
  -- Fuzzy search for helptags
  map('n', '<leader>h', ':<C-u>Telescope help_tags<cr>', options)
  -- Find file using grepping keywords
  map('n', '<leader>/', ':<C-u>Telescope live_grep<cr>', options)
  -- list all available branches
  map('n', '<leader>gb', ':<C-u>Telescope git_branches<cr>', options)
  -- list all the opened buffers
  map('n', '<leader>bb', ':<C-u>Telescope buffers<cr>', options)
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
	-- go to first tab
	map('n', '<leader>1', '1gt<CR>', options)
	-- go to second tab
	map('n', '<leader>2', '2gt<CR>', options)
	-- go to third tab
	map('n', '<leader>3', '3gt<CR>', options)
	-- go to frouth tab
	map('n', '<leader>4', '4gt<CR>', options)
	-- toggle list visibility.
	map('n', '<leader>zl', '<cmd>set list!<CR>', options)
	-- Close the current tab.
	map('n', 'td', '<cmd>tabclose<CR>', options)
  -- Open terminal
	map('n', '<leader>t', '<cmd>10split term://zsh<CR>', options)
	-- toggle Lexplore.
	map('n', '<leader>et', "<cmd>NvimTreeToggle<CR>",options)
	-- Find file in nvim tree
	map('n', '<leader>ef', "<cmd>NvimTreeFindFile<CR>",options)
	-- nvim tree collapse
	map('n', '<leader>ec', "<cmd>NvimTreeCollapse<CR>",options)
  -- Delete the current buffer
	map('n', '<leader>bd', '<cmd>bd<CR>', options)
  -- Go to the previcus buffer
	map('n', '<leader>b<', '<cmd>bp<CR>', options)
  -- Go to the next buffer
	map('n', '<leader>b>', '<cmd>bn<CR>', options)
  -- Write the buffer content to file
	map('n', '<leader>fs', '<cmd>w<CR>', options)
	-- open diffview
	map('n', '<leader>gg', '<cmd>DiffviewOpen<CR>', options)
	-- Lemme quickly run a command right now.
	map('n', '<leader>r', ':!', options)
	-- toogle alpha vim.
	map('n', '\\a', '<cmd>Alpha<CR>', options)
end

local function language_mapping()
  --[[ A (very helpfull mapping which helps
   to forget keeping track of caps lock toggle by using language mapping
   ------
   Execute :lmap and map every smallercase chars to its uppercase equivalent ]]
	local fn = vim.fn;
	local options = { noremap = true }
	local starting_char_A = fn.char2nr('A')
	local ending_char_Z = fn.char2nr('Z')

	for i = starting_char_A,ending_char_Z do
		map('l', fn.nr2char(i + 32), fn.nr2char(i), options)
		map('l', fn.nr2char(i), fn.nr2char(i + 32), options)
	end
end

MyMod = {}
function MyMod.compose_scroll(delta)
	local fn = vim.fn
	local nvim_eval = vim.api.nvim_eval
	local nvim_select_popupmenu_item = vim.api.nvim_select_popupmenu_item
	local call = vim.call
		if fn.pumvisible() ~= 0 then
			local i = fn['complete_info']{'selected'}
			call(
				'timer_start',
				0,
				function()
					nvim_select_popupmenu_item(i.selected + delta, nvim_eval('v:true'), nvim_eval('v:false'), {})
				end
			)
		end
		return vim.api.nvim_eval('"\\<Ignore>"')
 end

local function compe_scroll_mapping()
	-- nvim-compe scroll map
	map('i', '<C-j>', 'v:lua.MyMod.compose_scroll(+4)', { noremap = true, expr = true, silent = true })
	map('i', '<C-k>', 'v:lua.MyMod.compose_scroll(-4)', { noremap = true, expr = true, silent = true })
end

popular_mapping()
application_switch()
my_mappings()
language_mapping()
compe_scroll_mapping()
telescope_mapping()
