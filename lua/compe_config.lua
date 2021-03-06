vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = false;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false; -- not using any snippets engine yet.
    ultisnips = true;
    luasnip = false;
  };
}

local map = vim.api.nvim_set_keymap
local opts = { expr = true, silent = true, noremap = true }



local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn['vsnip#available'](1) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  else check_back_space()
    return t "<Tab>"
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn['vsnip#jumpable'](-1) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

map("i", "<Tab>", "v:lua.tab_complete()", opts)
map("s", "<Tab>", "v:lua.tab_complete()", opts)
map("i", "<S-Tab>", "v:lua.s_tab_complete()", opts)
map("s", "<S-Tab>", "v:lua.s_tab_complete()", opts)

map("i", "<C-Space>", "compe#complete()", opts)
map("i", "<CR>", "compe#confirm('<CR>')", opts)
map("i", "<C-e>", "compe#close('<C-e>')", opts)
