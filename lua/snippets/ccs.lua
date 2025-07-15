local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("class", {
    t("."), i(1, "class"), t({" {", "\t"}), i(2), t({"", "}"}),
  }),
  s("id", {
    t("#"), i(1, "id"), t({" {", "\t"}), i(2), t({"", "}"}),
  }),
}
