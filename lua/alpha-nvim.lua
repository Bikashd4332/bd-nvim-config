local alpha = require'alpha'
local startify = require'alpha.themes.startify'

startify.section.header.val = {
	[[ _   _  _     ______  _  _                 _     ]],
	[[| | | |(_)    | ___ \(_)| |               | |    ]],
	[[| |_| | _     | |_/ / _ | | __  __ _  ___ | |__  ]],
	[[|  _  || |    | ___ \| || |/ / / _` |/ __|| '_ \ ]],
	[[| | | || | _  | |_/ /| ||   < | (_| |\__ \| | | |]],
	[[\_| |_/|_|( ) \____/ |_||_|\_\ \__,_||___/|_| |_|]],
	[[       |/                                        ]],
}

startify.section.top_buttons.val = {
		startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
}
-- disable MRU
startify.section.mru.val = { { type = "padding", val = 0 } }

-- disable MRU cwd
startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
startify.section.bottom_buttons.val = {
		startify.button( "q", "  Quit NVIM" , ":qa<CR>"),
}

startify.opts.position = "center"

alpha.setup(startify.opts)
