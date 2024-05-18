local M = {}

--------------------------------------------------------------------------------

---@param msg string
---@param level? "info"|"trace"|"debug"|"warn"|"error"
function M.notify(msg, level)
  level = level or "info"
  vim.notify(msg, vim.log.levels[level:upper()], { title = "pond-nvim" })
end

--------------------------------------------------------------------------------

return M
