" create an auto command which will toggle it off automatically for you
  autocmd InsertLeave * set iminsert=0
"--
	" disable folding for few buffers
  autocmd FileType alpha set showtabline=0 | set nofoldenable | autocmd BufUnload <buffer> set showtabline=2
  autocmd FileType DiffviewFiles windo set nolist
"--
	" map q as quit for all git related buffers
  autocmd FileType git nmap q :quitall!<CR>
  autocmd FileType diff nmap q :quitall!<CR>
"--
	"	Add shellcheck as makeprg for sh, bash, zsh files
	autocmd FileType sh set makeprg=shellcheck\ -f\ gcc

"--
	" Add a command for clearing quickfix list.
	function ClearQuickFixList()
		call setqflist([])
	endfunction
 command! ClearQuickFixList :call ClearQuickFixList()
