local dap = require("dap")
local dapui = require("dapui")

-- Configuración de nvim-dap-ui
dapui.setup()

-- Auto abrir/cerrar UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Requiere las configuraciones por lenguaje
local langs = { "python", "javascript", "html", "cpp", "java" }

for _, lang in ipairs(langs) do
  local ok, _ = pcall(require, "configs.dap." .. lang)
  if not ok then
    vim.notify("No se pudo cargar configs.dap." .. lang, vim.log.levels.WARN)
  end
end
