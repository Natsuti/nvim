local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("func", {
    t("function "), i(1, "name"), t("("), i(2), t({") {", "\t"}), i(3), t({"", "}"}),
  }),
  s("log", {
    t("console.log("), i(1), t(")"),
  }),
  s("imp", {
    t("import "), i(1, "module"), t(" from '"), i(2, "source"), t("'")
  }),
}
