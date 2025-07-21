local dap = require "dap"
local dapui = require "dapui"

-- Auto abrir/cerrar UI al iniciar/terminar debug
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Carga de archivos por lenguaje si existen
local langs = { "python", "javascript", "html", "cpp" }

for _, lang in ipairs(langs) do
  local ok, _ = pcall(require, "dap." .. lang)
  if not ok then
    vim.notify("No se pudo cargar dap." .. lang, vim.log.levels.WARN)
  end
end
