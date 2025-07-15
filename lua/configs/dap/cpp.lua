local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode", -- puede ser solo lldb si vscode mode no disponible
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch C++",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- opcionalmente para C también
dap.configurations.c = dap.configurations.cpp
