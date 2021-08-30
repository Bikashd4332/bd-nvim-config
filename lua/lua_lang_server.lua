local split = vim.fn.split

local sumneko_root_path = "/Users/bikashdas/Downloads/lua-language-server"
local sumneko_bin_path = sumneko_root_path .. "/bin/" .. "macOS" .. "/lua-language-server"

local runtime_path = split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = { sumneko_bin_path, "-E", sumneko_root_path .. "/main.lua"  },
  settings = {
    Lua = {
      runtime = {
        --[[
        -- Tell the language server which version of lua you're using.
        -- (Most likely LuaJIT in case of Neovim)
        --]]
        version = "LuaJIT",
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize that vim is our global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the language server aware of the neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemtery = {
        enable = false,
      }
    }
  }
}
