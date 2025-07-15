-- ~/.config/nvim/lua/configs/runner.lua
-- Automatizadaor avanzado de tareas comunes por lenguaje

local uv = vim.loop
local api - vim.api

-- Utilidad para obtener extension de archivo actual
local function get_filetype()
  return vim.bo.filetype
end

-- Utilidad para obtener ruta actual del archivo 
local function get_current_file()
  return vim.fn.expand "%:p"
end 

-- Utilidad para obtener directorio del archivo
local function get_current_dir()
  return vim.fn.expand "%:p:h"
end

-- Utilidad para lanzar comando en terminal flotante
local function run_in_terminal(cmd)
  vim.cmd("belowright split | terminal " .. cmd)
end

-- Comandos por lenguaje
local commands = {
  python = {
    run = function()
      run_in_terminal("python " .. get_current_file())
    end,
    test = function()
      run_in_terminal("pytest " .. get_current_file())
    end,
  },

  cpp = {
    build = function()
      run_in_terminal("g++ " .. get_current_file() .. " -o /tmp/a.out")
    end,
    run = funtion()
    run_in_terminal("/tmp/a,out")
  end,
  },

  java = {
    build = function()
      run_in_terminal("javac " .. get_current_file())
    end,
    run = function()
      local name = vim.fn.expand("%:t:r")
      run_in_terminal("java " .. name)
    end,
  },

  html = {
    run = function()
      run_in_terminal("xdg-open " .. get_current_file())
    end,
  },
}

-- Registrar comandos globales
api.nvim_create_user_command("CodeBuild", function()
  local ft = get_filetype()
  if commands[ft] and commands[ft].build then
    commands[ft].build()
  else
    vim.notify("No build command for filetype: " .. ft, vim.log.levels.WARN)
  end
end, {})

api.nvim_create_user_command("CodeRun", function()
  local ft = get_filetype()
  if commands[ft] and commands[ft].run then
    commands[ft].run()
  else
    vim.notify("No run command for filetype: " .. ft, vim.log.levels.WARN)
  end
end, {})

api.nvim_create_user_command("CodeTest", function()
  local ft = get_filetype()
  if commands[ft] and commands[ft].test then
    commands[ft].test()
  else
    vim.notify("No test command for filetype: " .. ft, vim.log.levels.WARN)
  end
end, {})

-- Atajos opcionales
vim.keymap.set("n", "<leader>cb", ":CodeBuild<CR>", { desc = "Build code" })
vim.keymap.set("n", "<leader>cr", ":CodeRun<CR>", { desc = "Run code" })
vim.keymap.set("n", "<leader>ct", ":CodeTest<CR>", { desc = "Test code" })

