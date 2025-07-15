local M = {}

local function copy_template(template_name, target_dir)
  local template_path = vim.fn.stdpath("config") .. "/templates/" .. template_name
  local result = vim.fn.system({ "cp", "-r", template_path, target_dir })
  if vim.v.shell_error ~= 0 then
    vim.notify("Error copiando template: " .. result, vim.log.levels.ERROR)
  else
    vim.notify("Proyecto creado en " .. target_dir, vim.log.levels.INFO)
  end
end

function M.new_project(template_name)
  vim.ui.input({ prompt = "Nombre del nuevo proyecto: " }, function(input)
    if input then
      local target = vim.fn.getcwd() .. "/" .. input
      vim.fn.mkdir(target, "p")
      copy_template(template_name, target)
    end
  end)
end

return M
