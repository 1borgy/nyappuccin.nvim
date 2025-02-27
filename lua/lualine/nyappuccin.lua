local M = {}

function M.get()
  local c = require("nyappuccin.colors")

  return {
    normal = {
      a = { fg = tostring(c.mantle), bg = tostring(c.purple) },
      b = { fg = tostring(c.purple), bg = tostring(c.purple.mix(c.base, 65)) },
      c = { fg = tostring(c.lavender) },
    },

    insert = {
      a = { fg = tostring(c.mantle), bg = tostring(c.red) },
      b = { fg = tostring(c.red), bg = tostring(c.red.mix(c.base, 65)) },
      c = { fg = tostring(c.lavender) },
    },
    visual = {
      a = { fg = tostring(c.mantle), bg = tostring(c.green) },
      b = { fg = tostring(c.green), bg = tostring(c.green.mix(c.base, 65)) },
      c = { fg = tostring(c.lavender) },
    },
    replace = {
      a = { fg = tostring(c.mantle), bg = tostring(c.yellow) },
      b = { fg = tostring(c.yellow), bg = tostring(c.yellow.mix(c.base, 65)) },
      c = { fg = tostring(c.lavender) },
    },
    command = {
      a = { fg = tostring(c.mantle), bg = tostring(c.pink) },
      b = { fg = tostring(c.pink), bg = tostring(c.pink.mix(c.base, 65)) },
      c = { fg = tostring(c.lavender) },
    },
    terminal = {
      a = { fg = tostring(c.mantle), bg = tostring(c.teal) },
      b = { fg = tostring(c.teal), bg = tostring(c.teal.mix(c.base, 65)) },
      c = { fg = tostring(c.lavender) },
    },
  }
end

return M
