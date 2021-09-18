function! gitlink#GitLink(...)
	" Get the commit hash
	let l:hash = substitute(system("git rev-parse HEAD 2>/dev/null"),"\n","","")
	" Proceed only if we retrieved hash ( do nothing if  non git repository)
	if l:hash != ''
		" get the line address
		" try getting the index from argument if not found else fallback to 0
		" 1) search visually selected area
		" 2) Else get the line address of the current line.
		let l:line = get(a:, 1, 0) ? line("'<") . "-L" . line("'>") : line(".")
		" get the path to the file.
		let l:path = expand("%:p")
		" check if the file is dirty.
		let l:diff = strlen(system("git diff " . l:path))
		" show message if it is
		if l:diff
			return 'Please commit and push changes to this file before attempting to link to it.'
		endif
		" get the path of the root of this repository
		let l:root = substitute(system("git rev-parse --show-toplevel"),"\n","","")
		" ahd then substract so that we then only have the path of the target
		" file in the repository
		let l:file= substitute(l:path,l:root,"","")
		" check if the file the file is tracked.
		let l:isFileTracked = system("git ls-files " . l:path . " --error-unmatch")
		" show error if not tracked
		if v:shell_error
			return 'File is not tracked by repository'
		endif
		" get the origin url (can be git@ , https://, or ssh://)
		let l:remote = substitute(system("git config --get remote.origin.url"), ".git\n", "", "")
		if match(l:remote, '^https://') != -1
			let l:repoURL = l:remote
		elseif match(l:remote, '^git@') != -1
			let l:repoURL = substitute(l:remote,":","/","")
			let l:repoURL = substitute(l:repoURL,"^git@","https://","")
		elseif match(l:remote, '^ssh://') != -1
			let l:repoURL = substitute(l:remote,"^ssh://","https://","")
		elseif match(l:remote, '^git:') != -1
			let l:repoURL = substitute(l:remote,"^git:","https://","")
		endif
		" create the the final link.
		let l:final = l:repoURL . "/tree/" . l:hash . l:file . "#L" . l:line
		return l:final
	endif
	return ''
endfunction
