call plug#begin("~/.config/nvim". "/plugged")
   " List of all plugins
  Plug 'christoomey/vim-tmux-navigator'
	Plug 'goolord/alpha-nvim'
  Plug 'gruvbox-community/gruvbox'
  " Plug 'ray-x/lsp_signature.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'hoob3rt/lualine.nvim'
	Plug 'SirVer/ultisnips'
	Plug 'github/copilot.vim'

  Plug 'neovim/nvim-lspconfig'
	Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
	Plug 'skanehira/gh.vim'
	Plug 'kyazdani42/nvim-tree.lua'

  " fuzzy file finder integration
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Version control stuffs "
  Plug 'sindrets/diffview.nvim'

  " git or github integration
  Plug 'lewis6991/gitsigns.nvim'

  " Language extension --- > currently only (js)
  Plug 'maxmellon/vim-jsx-pretty',
	" Plug 'leafgarland/typescript-vim'
  Plug 'yuezk/vim-js'
  Plug 'tpope/vim-commentary'

call plug#end()

set termguicolors
set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_italic=1
let g:gh_token='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'

let g:loaded_node_provider=0
let g:loaded_perl_provider=0
let g:loaded_python_provider=0
let g:loaded_ruby_provider=0

set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
colorscheme gruvbox

"-------- Lua require ------------
lua require('init')
