local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("main", {
    t({
      "#include <iostream>",
      "",
      "int main() {",
      "\t"
    }), i(1, "// code here"), t({"", "\treturn 0;", "}"})
  }),
  s("inc", {
    t("#include <"), i(1, "iostream"), t(">")
  }),
  s("fn", {
    i(1, "void"), t(" "), i(2, "function"), t("("), i(3), t({") {", "\t"}), i(4), t({"", "}"})
  }),
}
