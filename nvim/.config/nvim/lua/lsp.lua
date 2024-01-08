local nvim_lsp = require('lspconfig')

-- completion with nvim_cmp 
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- Automatically select first item on tab
    --['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  --  Attach signature helper
  require "lsp_signature".on_attach({
    hint_prefix="",
    floating_window=true, 
    floating_window_above_cur_line=true
  })

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>fo', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

end

-- Update capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities())
-- Setup default for some of the language servers
local servers = { 'pyright', 'tsserver', 'texlab', 'eslint', 'lua_ls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
-- For C/c++ we use clangd. Here we want extra flags that enable parsing the
-- .clangd file which may be present in the project root (can contain format/linting rules)
nvim_lsp["clangd"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'clangd', '--background-index', "--enable-config"},
    flags = {
      debounce_text_changes = 150,
    }
}

-- Setup vscode's html lsp for embedded css/js
nvim_lsp["html"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "vscode-html-language-server", "--stdio" },
    initOptions = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    },
    flags = {
        debounce_text_changes = 150,
    }
}
-- Assuming '/path/to/project' is where mdlsp.py and pyproject.toml are located
local project_root = '/home/nb/repos/lspmd'

local mdlsp_config = {
        name = 'mdlsp',
        cmd = {"sh", "-c", "cd " .. project_root .. " && poetry run python mdlsp.py"},
        filetypes = {"markdown"},
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        root_dir = function(fname)
            return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.cwd()
        end,
}
require('lspconfig.configs').mdlsp = {
  default_config = mdlsp_config
}
-- Manually adding the custom LSP server configuration
nvim_lsp.mdlsp.setup(mdlsp_config)
