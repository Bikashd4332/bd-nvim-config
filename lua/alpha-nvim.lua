local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
		[[ _   _  _     ______  _  _                 _     ]],
		[[| | | |(_)    | ___ \(_)| |               | |    ]],
		[[| |_| | _     | |_/ / _ | | __  __ _  ___ | |__  ]],
		[[|  _  || |    | ___ \| || |/ / / _` |/ __|| '_ \ ]],
		[[| | | || | _  | |_/ /| ||   < | (_| |\__ \| | | |]],
		[[\_| |_/|_|( ) \____/ |_||_|\_\ \__,_||___/|_| |_|]],
		[[       |/                                        ]],
}

dashboard.section.buttons.val = {
	dashboard.button("e", "New file", ":enew <BAR> startinsert <CR>"),
	dashboard.button("c", "Goto nvim config", ":lcd ~/.config/nvim | e init.vim | vsplit ./lua/init.lua <CR>"),
	dashboard.button("o", "Goto old files", ":Telescope oldfiles <CR>"),
	dashboard.button("u", "Update all your plugins", ":PlugClean | PlugUpdate <CR>"),
	dashboard.button("q", "Quit neovim", ":quit! <CR>"),
	dashboard.button(
	".n", "Explore Node.js documentation", ":lcd ~/.config/yarn/global/node_modules/@types/node | e index.d.ts <CR>"
	),
	dashboard.button( "t", "Goto bd-scripts project", ":lcd ~/scripts/tmux_utils | Telescope git_files<CR>")
}

alpha.setup(dashboard.opts)
