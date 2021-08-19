  " Autoformat buffers of the below types on save
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
"--
  " create an auto command which will toggle it off automatically for you
  autocmd InsertLeave * set iminsert=0

