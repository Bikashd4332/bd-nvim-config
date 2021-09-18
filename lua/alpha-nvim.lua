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

alpha.setup(dashboard.opts)
