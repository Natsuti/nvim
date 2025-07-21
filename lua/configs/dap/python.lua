local dap = require "dap"

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      -- Detectar venv activo o usar python del sistema
      local venv_path = os.getenv "VIRTUAL_ENV"
      if venv_path then
        return venv_path .. "/bin/python"
      else
        return "python"
      end
    end,
  },
}
