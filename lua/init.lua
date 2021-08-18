  -- NVIM WEB DEVICONS --
  local nvim_web_devicons = require('nvim-web-devicons');
  nvim_web_devicons.setup {
    override = {};
    default = true
  }
  nvim_web_devicons.get_icons()
--
  -- DIFFVIEW --
  local cb = require'diffview.config'.diffview_callback
  vim.api.nvim_set_keymap(
    'n',
    '<leader>gd', '<cmd>DiffviewClose<CR>',
    { noremap = true, silent = true }
  )
  require'diffview'.setup {
    diff_binaries = false,
    file_panel = {
      width = 35,
      use_icons = true
    },
    key_bindings = {
      disable_defaults = true,
      view = {
        ["<tab>"] = cb("select_next_entry"),
        ["<s-tab>"] = cb("select_prev_entry"),
        ["e"] = cb("focus_files"),
        ["b"] = cb("toggle_files"),
      },
      file_panel = {
        ["j"] = cb("next_entry"),
        ["k"] = cb("prev_entry"),
        ["-"] = cb("toggle_stage_entry"),
        ["o"] = cb("select_entry"),
        ["S"] = cb("stage_all"),

        ["U"] = cb("unstag_all"),
        ["x"] = cb("restore_entry"),
        ["R"] = cb("refresh_files"),
        ["<tab>"] = cb("select_next_entry"),
        ["<s-tab>"] = cb("select_prev_entry"),
      }
    }
  }
--
  -- GITSIGNS --
  require'gitsigns'.setup({
  -- what signs (color, text) should be used for dispaying hunks
    signs = {
      add          = { hl='GitSignsAdd',    text='+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
      change       = { hl='GitSignsChange', text='|', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = { hl='GitSignsDelete', text='_', numhl='GitsignsDeleteNr', linehl='GitsignsDeleteLn'},
      topdelete    = { hl='GitSignsDelete', text='-', numhl='GitsignsDeleteNr', linehl='GitsignsDeleteLn'},
      changedelete = { hl='GitSignsChange', text='~', numhl='GitSignsChagneNr', linehl='GitSignsChagneLn'},
    },
    numhl = false,
    linehl = false,
  -- ofcourse our keymaps
    keymaps = {
      noremap = true,
      ['n ]c'] =  { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [c'] =  { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({ vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>ha'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    },
    current_line_blame_delay = 1000,
    current_line_blame_position = 'eol',
    update_debounce = 100,
  })

-- Language server protocol configs
require'lsp'
