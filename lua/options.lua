-- key value of pair of all options.
local global_options = {
	-- Enable relative line number and show linenumber instead of just 0
	relativenumber = true,
	number = true,
	-- increase the height of the cmdline for better message dispay
	cmdheight=2,
	-- set file encoding
	encoding = 'UTF-8',
	-- setting font
	guifont = 'DroidSansMono\\ Nerd\\ font:h11',
	-- enabling visibility of listchars
	list = true,
	-- specifying mapping of unvisible chars to visible chars.
	listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·',
	-- do not unload a buffer and hidden; keep in memory
	hidden = true,
	-- do not wrap text , keep going on
	wrap = false,
	-- Also have a vertical bar to represent the wrapping limit
	colorcolumn = '100',
	-- do not keep highlighting the search text after search
	hlsearch = false,
	-- always prefer bottom horizontal split
	splitbelow = true,
	-- always prefer right vertical split
	splitright = true,
	-- making vim not crate any swap file or backup
	backupcopy = 'yes',
	backup = false,
	swapfile = false,
	writebackup = false,
	-- Please let me stay in the block cursor " even in insert mode.
	guicursor= 'n-c-v:block-nCursor',
	-- fold configuration and fold level
	foldmethod = 'indent',
	foldnestmax = 2,
	-- scroll and also make the cursor reachable
	scrolloff = 8,
	-- use 2 tabs as indentation
	tabstop = 2,
	expandtab = false,
	softtabstop = 2,
	shiftwidth = 2,
	-- enable auto indent code
	smartindent = true,
}

-- set options iteratively
local function set_options(options_to_set, options_env)
	for option, value in pairs(options_to_set) do
		options_env[option]  = value
	end
end

set_options(global_options, vim.o)
