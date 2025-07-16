local wal_colors = {}

local ok, json = pcall(require, "dkjson")  -- or use vim.fn.json_decode
if not ok then
  vim.notify("dkjson not found!", vim.log.levels.ERROR)
  return wal_colors
end

local color_file = os.getenv("HOME") .. "/.cache/wal/colors.json"
local file = io.open(color_file, "r")
if not file then return wal_colors end

local content = file:read("*a")
file:close()

local data = json.decode(content)
if data and data.colors then
  wal_colors = data.colors
end

return wal_colors

