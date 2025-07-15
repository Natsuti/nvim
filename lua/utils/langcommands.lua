local M = {}

-- Tabla de comandos por lenguaje
local lang_cmds = {
  python = {
    build = nil,
    run = "python %",
    test = "pytest",
  },
  cpp = {
    build = "g++ % -o out && echo 'Compilado ✔️'",
    run = "./out",
    test = nil,
  },
  java = {
    build = "javac %",
    run = "java %:r",
    test = nil,
  },
  html = {
    run = "!xdg-open %",
  },
  javascript = {
    run = "node %",
  },
}

-- Ejecuta el comando adecuado según el tipo
function M.run_action(action)
  local ft = vim.bo.filetype
  local cmds = lang_cmds[ft]
  if not cmds then
    vim.notify("No hay comandos configurados para filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  local cmd = cmds[action]
  if not cmd then
    vim.notify("No hay comando para: " .. action .. " en " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd("split | terminal " .. cmd)
end

return M
