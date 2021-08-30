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
    '<leader>gdc', '<cmd>DiffviewClose<CR>',
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
        ["<leader><tab>"] = cb("select_next_entry"),
        ["<leader><s-tab>"] = cb("select_prev_entry"),
        ["<leader>gde"] = cb("focus_files"),
        ["<leader>gdb"] = cb("toggle_files"),
      },
      file_panel = {
        ["<leader>gdj"] = cb("next_entry"),
        ["<leader>gdk"] = cb("prev_entry"),
        ["<leader>gd-"] = cb("toggle_stage_entry"),
        ["<leader>gdo"] = cb("select_entry"),
        ["<leader>gdS"] = cb("stage_all"),

        ["<leader>gdU"] = cb("unstag_all"),
        ["<leader>gdx"] = cb("restore_entry"),
        ["<leader>gdR"] = cb("refresh_files"),
        ["<leader>gd<tab>"] = cb("select_next_entry"),
        ["<leader>gd<s-tab>"] = cb("select_prev_entry"),
        ["<leader>gde"] = cb("focus_files"),
        ["<leader>gdb"] = cb("toggle_files"),
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

      ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({ vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>ghA'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
      ['n <leader>ghu'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    },
    current_line_blame_delay = 1000,
    current_line_blame_position = 'eol',
    update_debounce = 100,
  })
--
-- Telescope
require'telescope'.load_extension('fzf')


-- Language server protocol configs
require'lsp'
