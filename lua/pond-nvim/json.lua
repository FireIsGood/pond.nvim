local M = {}

local util = require("pond-nvim.util")

--------------------------------------------------------------------------------

---Write a table to the path
---@param table table
---@param path string
function M.write_json(table, path)
  -- Encode our data
  local data = vim.fn.json_encode(table)

  -- Open the file
  local file, err = io.open(path, "w+")
  if not file then
    util.notify("Could not open file: " .. err, "error")
    return
  end

  -- Write our data
  file:write(data)
  file:close()
end

---Read a json file from the path
---@param path string
---@return table?
function M.read_json(path)
  -- Open the file
  local file, _ = io.open(path, "r")
  if not file then
    return nil
  end

  -- Read our data
  local encoded_data = file:read("*a")
  file:close()

  return vim.fn.json_decode(encoded_data)
end

--------------------------------------------------------------------------------

return M
