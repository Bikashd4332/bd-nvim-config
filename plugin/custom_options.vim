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

" fold configuration and fold level
set foldmethod=indent
set foldnestmax=2

"scroll and also make the cursor reachable
set scrolloff=8

" use 2 spaces as indentation
set tabstop=2 noexpandtab softtabstop=2 
set shiftwidth=2
set smartindent

" Enable relative line number and show linenumber instead of just 0
set relativenumber
set number

" increase the height of the cmdline
" for better message dispay
set cmdheight=2

" lets make vim more responsive by
" decreasing updatetime delay.
let updatetime=50
