call plug#begin("~/.config/nvim". "/plugged")
  " List of all plugins
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'gruvbox-community/gruvbox'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'hrsh7th/nvim-compe'

  " Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'

  " fuzzy file finder integration
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'

  " Version control stuffs "
  Plug 'sindrets/diffview.nvim'

  " git or github integration
  Plug 'lewis6991/gitsigns.nvim'

  " Language extension --- > currently only (js)
  Plug 'maxmellon/vim-jsx-pretty',
  Plug 'yuezk/vim-js'
  Plug 'tpope/vim-commentary'
call plug#end()

set termguicolors
colorscheme gruvbox

" -------- Lua require ------------
lua require('init')
