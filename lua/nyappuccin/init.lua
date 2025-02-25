local M = {}

M.setup = function(opts)
    local theme = require("nyappuccin.theme")
    require('lush')(theme)
end

-- Return our parsed theme for extension or use elsewhere.
return M
