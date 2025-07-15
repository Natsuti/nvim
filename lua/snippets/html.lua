local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("html", {
    t({"<!DOCTYPE html>", "<html>", "<head>", "\t<title>"}), i(1, "Title"), t({"</title>", "</head>", "<body>", "\t"}), i(2), t({"", "</body>", "</html>"}),
  }),
  s("div", {
    t("<div>"), i(1), t("</div>")
  }),
}
