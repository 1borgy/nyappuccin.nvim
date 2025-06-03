--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local C = require("nyappuccin.colors")
local lush = require("lush")

local M = {}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
M.theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn({ bg = C.pink.mix(C.base, 85).de(10) }), -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor({ bg = C.red }), -- Character under the cursor
    CurSearch({ bg = C.green.mix(C.base, 75), fg = C.green }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine({ bg = C.purple.mix(C.base, 85).de(10) }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- CursorLineSign { CursorLine },
    Directory({ fg = C.lavender, bold = true }), -- Directory names (and other special names in listings)
    DiffAdd({ fg = C.green }), -- Diff mode: Added line |diff.txt|
    DiffChange({ fg = C.yellow }), -- Diff mode: Changed line |diff.txt|
    DiffDelete({ fg = C.red }), -- Diff mode: Deleted line line |diff.txt|
    DiffText({ bg = C.yellow.mix(C.base, 60).de(20) }), -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    VertSplit({ bg = C.mantle }), -- Column separating vertically split windows
    Folded({ bg = C.red.mix(C.base, 80).de(20) }), -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr({ fg = C.surface1 }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove({ fg = C.surface1 }), -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow({ fg = C.surface1 }), -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr({ CursorLine, fg = C.purple }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen({ bg = C.pink.mix(C.base, 75), fg = C.pink }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    NonText({ fg = C.surface1 }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal({ bg = C.base, fg = C.text }), -- Normal text
    NormalFloat({ Normal }), -- Normal text in floating windows.
    FloatBorder({ fg = C.surface1 }), -- Border of floating windows.
    FloatTitle({ fg = C.lavender }), -- Title of floating windows.
    -- NormalNC { fg = C.lavender, bg = C.mantle }, -- normal text in non-current windows
    -- NormalNC({ Normal }),
    Pmenu({ Normal }), -- Popup menu: Normal item.
    PmenuSel({ CursorLine }), -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar({ bg = C.mantle }), -- Popup menu: Scrollbar.
    PmenuThumb({ bg = C.red }), -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine({ bg = C.base }), -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title({ fg = C.red, bold = true }), -- Titles for output from ":set all", ":autocmd" etc.
    Visual({ bg = C.purple.mix(C.base, 65).de(25) }), -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    Whitespace({ fg = C.surface1 }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator({ VertSplit }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    WinBar({ fg = C.text }), -- Window bar of current window
    WinBarNC({ WinBar }), -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment({ fg = C.surface2 }), -- Any comment

    Constant({ fg = C.lavender }), -- (*) Any constant
    String({ fg = C.pink }), --   A string constant: "this is a string"
    Character({ fg = C.teal }), --   A character constant: 'c', '\n'
    Number({ fg = C.pink }), --   A number constant: 234, 0xff
    Boolean({ fg = C.red }), --   A boolean constant: TRUE, false
    Float({ Number }), --   A floating point constant: 2.3e10

    Identifier({ fg = C.lavender }), -- (*) Any variable name
    Function({ fg = C.purple }), --   Function name (also: methods for classes)

    Statement({ fg = C.blue }), -- (*) Any statement
    Conditional({ fg = C.red }), --   if, then, else, endif, switch, etc.
    Repeat({ fg = C.red }), --   for, do, while, etc.
    Label({ fg = C.red }), --   case, default, etc.
    Operator({ fg = C.lavender }), --   "sizeof", "+", "*", etc.
    Keyword({ fg = C.red }), --   any other keyword
    Exception({ fg = C.red }), --   try, catch, throw

    PreProc({ fg = C.pink }), -- (*) Generic Preprocessor
    Include({ fg = C.red }), --   Preprocessor #include
    Define({ fg = C.pink }), --   Preprocessor #define
    Macro({ fg = C.red }), --   Same as Define
    PreCondit({ fg = C.pink }), --   Preprocessor #if, #else, #endif, etc.

    Type({ fg = C.green }), -- (*) int, long, char, etc.
    StorageClass({ fg = C.pink }), --   static, register, volatile, etc.
    Structure({ fg = C.pink }), --   struct, union, enum, etc.
    Typedef({ fg = C.green }), --   A typedef

    Special({ fg = C.red }), -- (*) Any special symbol
    SpecialChar({ fg = C.red }), --   Special character in a constant
    Tag({ fg = C.lavender }), --   You can use CTRL-] on this
    Delimiter({ fg = C.lavender }), --   Character that needs attention
    SpecialComment({ fg = C.purple }), --   Special things inside a comment (e.g. '\n')
    Debug({ fg = C.pink }), --   Debugging statements

    Underlined({ bold = true }), -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error({ bg = C.red.mix(C.base, 60).de(20) }), -- Any erroneous construct
    Todo({ fg = C.teal, bold = true }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    Added({ fg = C.green }),
    Removed({ fg = C.red }),
    Changed({ fg = C.yellow }),

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError({ fg = C.red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn({ fg = C.yellow }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo({ fg = C.purple }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint({ fg = C.teal }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk({ fg = C.green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError({ fg = C.red, bg = C.red.mix(C.base, 80).de(10) }), -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn({ fg = C.yellow, bg = C.yellow.mix(C.base, 80).de(10) }), -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo({ fg = C.purple, bg = C.purple.mix(C.base, 80).de(10) }), -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint({ fg = C.teal, bg = C.teal.mix(C.base, 80).de(10) }), -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk({ fg = C.green, bg = C.green.mix(C.base, 80).de(10) }), -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError({ sp = C.red, underline = false, undercurl = true }), -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn({ sp = C.yellow, underline = false, undercurl = true }), -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo({ sp = C.purple, underline = false, undercurl = true }), -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint({ sp = C.teal, underline = false, undercurl = true }), -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk({ sp = C.green, underline = false, undercurl = true }), -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
    sym("@constructor")({ fg = C.green }),

    sym("@constructor.lua")({ fg = C.purple }),

    sym("@keyword.function")({ fg = C.red }),
    sym("@keyword.operator")({ fg = C.red }),
    sym("@keyword.modifier")({ fg = C.red }),
    sym("@keyword.return")({ fg = C.red }),

    sym("@parameter")({ fg = C.lavender }),
    sym("@variable")({ fg = C.text }),
    sym("@variable.parameter")({ fg = C.text }),

    sym("@type.builtin")({ fg = C.teal }),
    sym("@function.builtin")({ fg = C.purple }),

    sym("@namespace")({ fg = C.yellow }),
    sym("@constant.builtin")({ fg = C.teal }),
    sym("@variable.builtin")({ fg = C.teal }),

    sym("@module")({ fg = C.yellow }),

    sym("@attribute")({ fg = C.purple }),

    illuminatedWord({ bg = C.purple.mix(C.base, 75) }),
    illuminatedCurWord({ illuminatedWord }),
    IlluminatedWordRead({ illuminatedWord }),
    IlluminatedWordText({ illuminatedWord }),
    IlluminatedWordWrite({ illuminatedWord }),
    LspReferenceRead({ illuminatedWord }),
    LspReferenceText({ illuminatedWord }),
    LspReferenceWrite({ illuminatedWord }),
    QuickFixLine({ illuminatedWord }),

    SnacksDashboardHeader({ fg = C.pink }),
    SnacksDashboardFooter({ fg = C.lavender }),
    SnacksDashboardIcon({ fg = C.purple }),
    SnacksDashboardKey({ fg = C.purple }),
    SnacksDashboardDesc({ fg = C.lavender }),
    SnacksDashboardSpecial({ fg = C.red }),

    SnacksIndentScope({ fg = C.purple }),
    SnacksIndent({ fg = C.surface0 }),

    -- MiniFilesDirectory { fg = C.lavender },
    -- MiniFilesTitle { fg = C.red, bold = false },
    -- MiniFilesTitleFocused { fg = C.red },

    CompletionBorder({ fg = C.surface1 }),
    DocumentationBorder({ fg = C.surface1 }),

    BlinkCmpMenuBorder({ fg = C.surface1 }),
    BlinkCmpDocBorder({ fg = C.surface1 }),
    BlinkCmpMenuSelection({ CursorLine }),

    -- BlinkCmpKindField { fg = C.red },
    -- BlinkCmpKindProperty { fg = C.red },
    -- BlinkCmpKindEvent { fg = C.purple },
    --
    -- BlinkCmpKindText { fg = C.purple },
    -- BlinkCmpKindEnum { fg = C.pink },
    -- BlinkCmpKindKeyword { fg = C.purple },
    --
    -- BlinkCmpKindConstant { bg = C.base },
    -- BlinkCmpKindConstructor { bg = C.base },
    -- BlinkCmpKindReference { fg = C.purple },
    --
    -- BlinkCmpKindFunction { fg = C.purple },
    -- BlinkCmpKindStruct { fg = C.green },
    -- BlinkCmpKindClass { fg = C.green },
    -- BlinkCmpKindModule { fg = C.yellow },
    -- BlinkCmpKindOperator { fg = C.lavender },
    --
    -- BlinkCmpKindVariable { fg = C.lavender },
    -- BlinkCmpKindFile { fg = C.pink },
    --
    -- BlinkCmpKindUnit { fg = C.purple },
    -- BlinkCmpKindSnippet { fg = C.lavender },
    -- BlinkCmpKindFolder { fg = C.purple },
    --
    -- BlinkCmpKindMethod { fg = C.purple },
    -- BlinkCmpKindValue { fg = C.lavender },
    -- BlinkCmpKindEnumMember { fg = C.lavender },
    --
    -- BlinkCmpKindInterface { fg = C.green },
    -- BlinkCmpKindColor { fg = C.purple },
    -- BlinkCmpKindTypeParameter { fg = C.green },
    -- BlinkCmpKindCopilot { fg = C.purple },

    Search({
      bg = C.purple.mix(C.base, 80),
      fg = C.purple,
    }),
    NoiceVirtualText({ Search }),

    GitGraphHash({ fg = C.pink }),
    GitGraphTimestamp({ fg = C.lavender }),
    GitGraphAuthor({ fg = C.teal }),
    GitGraphBranchName({ fg = C.purple }),
    GitGraphBranchTag({ fg = C.red }),
    GitGraphBranchMsg({ fg = C.lavender }),

    GitGraphBranch1({ fg = C.green }),
    GitGraphBranch2({ fg = C.blue }),
    GitGraphBranch3({ fg = C.yellow }),
    GitGraphBranch4({ fg = C.pink }),
    GitGraphBranch5({ fg = C.red }),

    SnacksPickerCursorLine({ CursorLine }),

    DropBarIconUIPickPivot({ fg = C.purple, bold = true }),
    DropBarIconKindFolder({ fg = C.purple }),
    MiniFilesDirectory({ fg = C.lavender }),

    -- MiniIconsAzure({ fg = C.purple }),

    GitConflictCurrent({ bg = C.pink.mix(C.base, 65) }),
    GitConflictAncestor({ bg = C.teal.mix(C.base, 65) }),
    GitConflictIncoming({ bg = C.purple.mix(C.base, 65) }),
    -- GitConflictCurrentLabel({ bg = C.pink, fg = C.base }),
    -- GitConflictAncestorLabel({ bg = C.teal, fg = C.base }),
    -- GitConflictIncomingLabel({ bg = C.purple, fg = C.base }),
    GitConflictCurrentLabel({ GitConflictCurrent }),
    GitConflictAncestorLabel({ GitConflictAncestor }),
    GitConflictIncomingLabel({ GitConflictIncoming }),

    GrugFarInputLabel({ fg = C.purple }),
    GrugFarHelpHeaderKey({ fg = C.red }),

    ErrorMsg({ fg = C.lavender }),
    MoreMsg({ fg = C.lavender }),
    WarningMsg({ fg = C.lavender }),
    ModeMsg({ fg = C.lavender }),

    RenderMarkdownCode({ bg = C.mantle }),
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return M.theme

-- vi:nowrap
