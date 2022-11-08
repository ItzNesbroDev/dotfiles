local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup {
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  },
  window = { documentation = { border = "shadow" } },
  snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-1),
      ['<C-f>'] = cmp.mapping.scroll_docs(1),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
          if luasnip.jumpable() then luasnip.jump(1) else fallback() end
      end
  },
  sources = cmp.config.sources {
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'nvim_diagnostic' },
      { name = 'buffer'},
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'emoji'},
  },
  experimental = { ghost_text = true }
}
