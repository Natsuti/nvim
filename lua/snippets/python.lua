local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("def", {
    t("def "), i(1, "function_name"), t("("), i(2, "args"), t({"):", "\t"}), i(3, "pass"),
  }),
  s("class", {
    t("class "), i(1, "ClassName"), t({":", "\tdef __init__(self, "}), i(2), t({"):", "\t\t"}), i(3), t({"", ""})
  }),
  s("imp", {
    t("import "), i(1, "module"),
  }),
}
