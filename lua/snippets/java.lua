local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("main", {
    t({
      "public class " }), i(1, "Main"), t({ " {",
      "\tpublic static void main(String[] args) {",
      "\t\t"
    }), i(2, "// code"), t({
      "",
      "\t}",
      "}"
    })
  }),

  s("sysout", {
    t("System.out.println("), i(1, "\"message\""), t(");")
  }),

  s("class", {
    t("public class "), i(1, "ClassName"), t({" {", "\t"}), i(2, "// body"), t({"", "}"})
  }),

  s("method", {
    t("public "), i(1, "void"), t(" "), i(2, "methodName"), t("("), i(3, "params"), t({") {", "\t"}), i(4, "// body"), t({"", "}"})
  }),

  s("getter", {
    t("public "), i(1, "Type"), t(" get"), i(2, "Field"), t("() { return this."), i(3, "field"), t("; }")
  }),

  s("setter", {
    t("public void set"), i(1, "Field"), t("("), i(2, "Type"), t(" "), i(3, "value"), t({") {", "\tthis."}), i(4, "field"), t(" = "), i(5, "value"), t({";", "}"})
  }),
}
