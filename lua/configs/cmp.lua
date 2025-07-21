local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      require("configs.luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-ns>"] = cmp.mapping.select_next_item(),
    ["<C-ps>"] = cmp.mapping.select_prev_item(),
    ["<C-ys>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("configs.luasnip").expand_or_jumpable() then
        require("configs.luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 3 },
    { name = "path" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({ nvim_lsp = "[LSP]", luasnip = "[Snippet]", buffer = "[Buffer]", path = "[Path]" })[entry.source.name]
      return vim_item
    end,
  },
}
