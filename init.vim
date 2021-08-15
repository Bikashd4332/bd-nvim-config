" config location
let s:configpath = $HOME . "/.config/nvim"

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font:h11
set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

" do not unload a buffer and hidden; keep in memory
set hidden

" do not ring eny error bell on error
set noerrorbells

" do not wrap text , keep going on
set nowrap

"Also have a vertical bar to represent the wrapping limit
set colorcolumn=100

"do not keep highlighting the search text after search
set nohlsearch

" enable auto indent code
set smartindent

" always prefer bottom horizontal split
set splitbelow

" making vim not crate any
" swap file or backup
set backupcopy=yes
set nobackup
set noswapfile
set nowritebackup

" Please let me stay in the block cursor
" even in insert mode.
set guicursor=n-c-v:block-nCursor

" lets make vim more responsive by
" decreasing updatetime delay.
let updatetime=50

" fold configuration and fold level
set foldmethod=indent
set foldnestmax=2

"scroll and also make the cursor reachable
set scrolloff=8

" use 2 spaces as indentation
set tabstop=2 expandtab softtabstop=2 
set shiftwidth=2
set smartindent

" Enable relative line number and show linenumber instead of just 0
set relativenumber
set number

" increase the height of the cmdline
" for better message dispay
set cmdheight=2

" map my leader to be space
let mapleader=" "

" removing highlight after finishing a search.
nnoremap <silent><nowait> <leader>t :<C-u>10split term://zsh<cr>

" toggle Explorer with Lexplorer
nnoremap <silent><nowait> <leader>e :<C-u>Lexplore<cr>

" Delete the current buffer
nnoremap <silent><nowait> <leader>bd :<C-u>bd<CR>
nnoremap <silent><nowait> <leader>b< :<C-u>bp<CR>
nnoremap <silent><nowait> <leader>b> :<C-u>bn<CR>
nnoremap <silent><nowait> <leader>fs :<C-u>w<CR>

"A (very very)*n helpfull mapping which helps
"to forget keeping track of caps lock toggle by using language mapping
" ------
"Execute :lmap and map every smallercase chars to its uppercase equivalent
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" create an auto command which will toggle it off automatically for you
autocmd InsertLeave * set iminsert=0
" ------

" for quick nvim config editing.
execute  "nnoremap <silent><nowait> <leader>co :<C-u>70vs " . s:configpath . "/init.vim<cr>"

" ------- Usefull application switch remaps -------
nnoremap <silent><nowait> <leader>sl :<C-u>!open /Applications/Slack.app<CR>
nnoremap <silent><nowait> <leader>br :<C-u>!open "/Applications/Brave Browser.app"<CR>


" ----- popular remaps ------ "
inoremap jk <Esc>
inoremap JK <Esc>
" making Y be just like C , D
nnoremap Y y$

" keeping the cursor centered when doing things
" like moving to next/previous line
nnoremap N Nzz
nnoremap n nzz
nnoremap J mzJ`z

" adds undo sequence in insertmode for easier undo
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u
inoremap { {<c-g>u
inoremap _ _<c-g>u

" make jumplist add those lines that we jump relatively
nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . "k"
nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . "j"

" make current/visual selelcted line[s] move
 " in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" in normal mode
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" ----- popular mappings -----

call plug#begin(s:configpath . "/plugged")

Plug 'christoomey/vim-tmux-navigator'

" Plug 'tssm/fairyfloss.vim' 
" Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'


Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" fuzzy file finder integration
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
let g:tokyonight_style='night'
colorscheme tokyonight

" <silent> in front of mapping throws no error 
" in case if that fails.

" every hit of tab makes it go through
" the available completion list. by emulating <C-n>
"
" in case of any backspace it refreshes the completion list
let g:coc_disable_transparent_cursor=1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr>  <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function s:show_documentation()
  if(index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordpg . " " . expand('<cword'>)
  endif
endfunction

" Register text object for function
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)


" Coc command for folding
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Coc command for formatting with prettier.
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Symbol renaming support like vscode
nmap <leader>rn <Plug>(coc-rename)

" List all the diagnostic.
nnoremap <silent><nowait> <leader>a :<C-u>CocList diagnostics<cr>
" List all the available commands.
nnoremap <silent><nowait> <leader>c :<C-u>CocList commands<cr>
" find symbol for current document.
nnoremap <silent><nowait> <leader>o :<C-u>CocList outline<cr>

" List the files via FZF
nnoremap <silent><nowait> <leader><leader> :<C-u>Telescope find_files<cr>
" Fuzzy search for helptags
nnoremap <silent><nowait> <leader>h :<C-u>Telescope help_tags<cr>
" Find file using grepping keywords
nnoremap <silent><nowait> <leader>/ :<C-u>Telescope live_grep<cr>
" list all available branches
nnoremap <silent><nowait> <leader>gb :<C-u>Telescope git_branches<cr>
" list all available branches
nnoremap <silent><nowait> <leader>gs :<C-u>Telescope git_stashes<cr>
" list all the opened buffers
nnoremap <silent><nowait> <leader>bb :<C-u>Telescope buffers<cr>

" ---------------- Lua Code ----------------------

" config for nvim-web-devicons
lua << END
  local nvim_web_devicons = require('nvim-web-devicons');
  nvim_web_devicons.setup {
    override = {};
    default = true
  }
  nvim_web_devicons.get_icons()
END

" config for diffview.nvim
nnoremap <leader>gd :<C-u>DiffviewClose<cr>
lua << END
  local cb = require'diffview.config'.diffview_callback
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
END

" gitsigns.nvim
lua << END
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
END
