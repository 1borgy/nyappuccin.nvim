local lush = require("lush")
local hsl = lush.hsl

local base_h = 252

return {
  red = hsl(305, 70, 69),
  yellow = hsl(12, 67, 72),
  green = hsl(165, 50, 64),
  teal = hsl(199, 90, 69),
  blue = hsl(230, 94, 73),
  purple = hsl(253, 90, 72),
  pink = hsl(290, 74, 76),
  lavender = hsl(252, 90, 80),
  text = hsl(base_h, 70, 87),
  subtext1 = hsl(base_h, 44, 80),
  subtext0 = hsl(base_h, 29, 73),
  overlay2 = hsl(base_h, 22, 66),
  overlay1 = hsl(base_h, 20, 58),
  overlay0 = hsl(base_h, 20, 52),
  surface2 = hsl(base_h, 20, 44),
  surface1 = hsl(base_h, 20, 37),
  surface0 = hsl(base_h, 20, 30),
  base = hsl(base_h, 25, 24),
  mantle = hsl(base_h, 21, 20),
  crust = hsl(base_h, 20, 17),
}
