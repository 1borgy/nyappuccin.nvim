local M = {}

M.defaults = {
  compiled = false,
}

M.setup = function(opts)
  opts = vim.tbl_extend("force", M.defaults, opts or {})

  if opts.compiled then
    vim.cmd.colorscheme("nyappuccin")
  else
    local theme = require("nyappuccin.theme")
    require("lush")(theme)
  end
end

-- Return our parsed theme for extension or use elsewhere.
return M
