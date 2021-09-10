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
