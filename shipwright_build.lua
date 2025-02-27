local lushwright = require("shipwright.transform.lush")
local theme = require("nyappuccin.theme")
local C = require("nyappuccin.colors")
local helpers = require("shipwright.transform.helpers")

local function blend(color)
  return color.mix(C.base, 65).de(25)
end

run(
  theme,
  -- generate lua code
  lushwright.to_lua,
  -- write the lua code into our destination.
  -- you must specify open and close markers yourself to account
  -- for differing comment styles, patchwrite isn't limited to lua files.
  { patchwrite, "colors/nyappuccin.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)

local Fish = {}

Fish.template = [[
# name: 'nyappuccin'
# url: 'https://github.com/1borgy/nyappuccin'
# preferred_background: $fish_color_normal

fish_color_normal $fish_color_normal
fish_color_command $fish_color_command
fish_color_param $fish_color_param
fish_color_keyword $fish_color_keyword
fish_color_quote $fish_color_quote
fish_color_redirection $fish_color_redirection
fish_color_end $fish_color_end
fish_color_comment $fish_color_comment
fish_color_error $fish_color_error
fish_color_gray $fish_color_gray
fish_color_selection --background=$fish_color_selection_bg
fish_color_search_match --background=$fish_color_search_match_bg
fish_color_option $fish_color_option
fish_color_operator $fish_color_operator
fish_color_escape $fish_color_escape
fish_color_autosuggestion $fish_color_autosuggestion
fish_color_cancel $fish_color_cancel
fish_color_cwd $fish_color_cwd
fish_color_user $fish_color_user
fish_color_host $fish_color_host
fish_color_host_remote $fish_color_host_remote
fish_color_status $fish_color_status
]]

Fish.check_keys = {
  "fish_color_normal",
  "fish_color_command",
  "fish_color_param",
  "fish_color_keyword",
  "fish_color_quote",
  "fish_color_redirection",
  "fish_color_end",
  "fish_color_comment",
  "fish_color_error",
  "fish_color_gray",
  "fish_color_selection_bg",
  "fish_color_search_match_bg",
  "fish_color_option",
  "fish_color_operator",
  "fish_color_escape",
  "fish_color_autosuggestion",
  "fish_color_cancel",
  "fish_color_cwd",
  "fish_color_user",
  "fish_color_host",
  "fish_color_host_remote",
  "fish_color_status",
}

Fish.transform = function(colors)
  for _, key in ipairs(Fish.check_keys) do
    assert(colors[key], "fish colors table missing required key: " .. key)
  end

  for k, v in pairs(colors) do
    colors[k] = string.sub(string.lower(tostring(v)), 2)
  end

  local replaced = helpers.split_newlines(helpers.apply_template(Fish.template, colors))
  local kept = {}
  for _, line in ipairs(replaced) do
    if not string.match(line, "%$") then
      table.insert(kept, line)
    end
  end

  return kept
end

run({
  fish_color_normal = C.text,
  fish_color_command = C.purple,
  fish_color_param = C.lavender,
  fish_color_keyword = C.red,
  fish_color_quote = C.green,
  fish_color_redirection = C.pink,
  fish_color_end = C.yellow,
  fish_color_comment = C.overlay1,
  fish_color_error = C.red,
  fish_color_gray = C.overlay0,
  fish_color_selection_bg = C.surface0,
  fish_color_search_match_bg = C.surface0,
  fish_color_option = C.green,
  fish_color_operator = C.pink,
  fish_color_escape = C.red,
  fish_color_autosuggestion = C.overlay0,
  fish_color_cancel = C.red,
  fish_color_cwd = C.yellow,
  fish_color_user = C.teal,
  fish_color_host = C.blue,
  fish_color_host_remote = C.green,
  fish_color_status = C.red,
}, Fish.transform, { overwrite, "build/fish/nyappuccin.theme" })

local Ghostty = {}

Ghostty.template = [[
palette = 0=$palette_0
palette = 1=$palette_1
palette = 2=$palette_2
palette = 3=$palette_3
palette = 4=$palette_4
palette = 5=$palette_5
palette = 6=$palette_6
palette = 7=$palette_7
palette = 8=$palette_8
palette = 9=$palette_9
palette = 10=$palette_10
palette = 11=$palette_11
palette = 12=$palette_12
palette = 13=$palette_13
palette = 14=$palette_14
palette = 15=$palette_15
background = $background
foreground = $foreground
cursor-color = $cursor_color
selection-background = $selection_background
selection-foreground = $selection_foreground
]]

Ghostty.check_keys = {
  "background",
  "foreground",
  "cursor_color",
  "selection_background",
  "selection_foreground",
  "palette_0",
  "palette_1",
  "palette_2",
  "palette_3",
  "palette_4",
  "palette_5",
  "palette_6",
  "palette_7",
  "palette_8",
  "palette_9",
  "palette_10",
  "palette_11",
  "palette_12",
  "palette_13",
  "palette_14",
  "palette_15",
}

Ghostty.transform = function(colors)
  for _, key in ipairs(Ghostty.check_keys) do
    assert(colors[key], "ghostty colors table missing required key: " .. key)
  end
  local replaced = helpers.split_newlines(helpers.apply_template(Ghostty.template, colors))
  local kept = {}
  for _, line in ipairs(replaced) do
    if not string.match(line, "%$") then
      table.insert(kept, line)
    end
  end

  return kept
end

run({
  foreground = C.lavender,
  background = C.base,
  cursor_color = C.red,
  selection_background = blend(C.purple),
  selection_foreground = C.lavender,
  palette_0 = C.base,
  palette_1 = C.red,
  palette_2 = C.green,
  palette_3 = C.yellow,
  palette_4 = C.blue,
  palette_5 = C.pink,
  palette_6 = C.purple,
  palette_7 = C.text,
  palette_8 = C.base,
  palette_9 = C.red,
  palette_10 = C.green,
  palette_11 = C.yellow,
  palette_12 = C.blue,
  palette_13 = C.pink,
  palette_14 = C.purple,
  palette_15 = C.text,
}, Ghostty.transform, { overwrite, "build/ghostty/nyappuccin" })
