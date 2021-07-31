" config location
let s:configpath = "~/.config/nvim"

" mark buffers hidden
set hidden
set nohlsearch

" making vim not crate any
" swap file or backup
set nobackup
set nowritebackup

" use 2 spaces as indentation
set tabstop=2 expandtab softtabstop=2 
set shiftwidth=2

" Enable relative line number
set relativenumber
set number

" increase the height of the cmdline
" for better message dispay
set cmdheight=2

" Making window navigation easer.
nnoremap <M-l> <C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
" the same but for terminal buffers
tmap <M-k> <C-\><C-N><M-k>
tmap <M-l> <C-\><C-N><M-l>
tmap <M-j> <C-\><C-N><M-j>
tmap <M-h> <C-\><C-N><M-h>

" removing highlight after finishing a search.
nnoremap <silent><nowait> <leader>g :<C-u>noh<cr>

" toggle Explorer with Lexplorer
nnoremap <silent><nowait> <leader>e :<C-u>45 Lexplore<cr>

" for quick nvim config editing.
execute  "nnoremap <silent><nowait> <leader>co :<C-u>70vs " . s:configpath . "/init.vim<cr>"

" ----- popular remaps ------ "
inoremap jk <Esc>
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

Plug 'tssm/fairyfloss.vim' 

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language extension --- > currently only (js)
Plug 'maxmellon/vim-jsx-pretty',
Plug 'yuezk/vim-js'
Plug 'tpope/vim-commentary'

call plug#end()

set termguicolors
colorscheme fairyfloss

" <silent> in front of mapping throws no error 
" in case if that fails.

" every hit of tab makes it go through
" the available completion list. by emulating <C-n>
"
" in case of any backspace it refreshes the completion list
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

" make <CR> auto select the first item from 
" coc completion list.
" inoremap <silent><expr> <cr> \
"	pumvisible() ? coc#select_confirm()
" 	\: "\<C-g>u\<CR><c-r>=coc#on_enter()\<CR>"


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
imap <leader>f <Plug>(coc-format-selected)
vmap <leader>f <Plug>(coc-format-selected)

" Symbol renaming support like vscode
nmap <leader>rn <Plug>(coc-rename)

" List all the diagnostic.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" List all the available commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" find symbol for current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>

" List the files via FZF
nnoremap <silent><nowait> <space><space> :<C-u>GFiles<cr>
" Fuzzy search for helptags
nnoremap <silent><nowait> <space>h :<C-u>Helptags<cr>
