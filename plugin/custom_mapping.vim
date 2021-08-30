" map my leader to be space
let mapleader=" "

  " Telescope mappings
  " List all the diagnostic.
  nnoremap <silent><nowait> <leader>a :<C-u>Telescope lsp_document_diagnostics<cr>
  " find symbol for current document.
  nnoremap <silent><nowait> <leader>o :<C-u>Telescope lsp_document_symbols<cr>
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
"--
  "A (very very)*n helpfull mapping which helps
  "to forget keeping track of caps lock toggle by using language mapping
  " ------
  "Execute :lmap and map every smallercase chars to its uppercase equivalent
  for c in range(char2nr('A'), char2nr('Z'))
    execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
    execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
  endfor
"--
  " map for quick nvim config editing.
  execute  "nnoremap <silent><nowait> <leader>co :<C-u>70vs " . $HOME . "/.config/nvim" . "/init.vim<cr>"
"--
  " Popular remaps
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
 " do not make visual selection disappear
  vnoremap > >gv
  vnoremap < <gv
"--
  " Usefull application switch remaps
  nnoremap <silent><nowait> <leader>sl :<C-u>!open /Applications/Slack.app<CR>
  nnoremap <silent><nowait> <leader>br :<C-u>!open "/Applications/Brave Browser.app"<CR>
"--
  " My Custom general purpose maps
  " Open terminal
  nnoremap <silent><nowait> <leader>t :<C-u>10split term://zsh<cr>
  " toggle Explorer with Lexplorer
  nnoremap <silent><nowait> <leader>e :<C-u>Lexplore<cr>
  " Delete the current buffer
  nnoremap <silent><nowait> <leader>bd :<C-u>bd<CR>
  " Go to the previous buffer
  nnoremap <silent><nowait> <leader>b< :<C-u>bp<CR>
  " Go to the next buffer
  nnoremap <silent><nowait> <leader>b> :<C-u>bn<CR>
  " Write the buffer content to file
  nnoremap <silent><nowait> <leader>fs :<C-u>w<CR>
"--
  " nvim-compe scroll map 
  function! s:s(delta) abort
      if pumvisible()
        let l:i = complete_info(['selected']).selected
        call timer_start(0, { -> nvim_select_popupmenu_item(l:i + a:delta, v:true, v:false, {}) })
      endif
      return "\<Ignore>"
    endfunction
    inoremap <silent><expr><C-j>     <SID>s(+4)
    inoremap <silent><expr><C-k>     <SID>s(-4)
