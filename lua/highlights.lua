local cmd = vim.cmd

local colors = require('themes.dracula')

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local grey = colors.grey
local light_grey = colors.light_grey
local grey_fg = colors.grey_fg
local red = colors.red
local line = colors.line
local green = colors.green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow
local purple = colors.purple
local pmenu_bg = colors.pmenu_bg
local folder_bg = colors.folder_bg

-- for guifg , bg

local function fg(group, color)
   cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
   cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- blankline

fg("IndentBlanklineChar", line)

-- misc --
fg("LineNr", grey)

-- Comments
cmd("hi Comment gui=italic guifg=" .. grey_fg)

fg("NvimInternalError", red)
fg("VertSplit", line)
fg("EndOfBuffer", black)
fg_bg("Visual",light_grey, colors.lightbg)

-- inactive statuslines as thin splitlines
cmd("hi! StatusLineNC gui=underline guifg=" .. line)

-- line n.o
cmd "hi clear CursorLine"
fg("cursorlinenr", white)

-- git signs ---
fg_bg("DiffAdd", nord_blue, "none")
fg_bg("DiffChange", grey_fg, "none")
fg_bg("DiffModified", nord_blue, "none")

-- NvimTree
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeOpenedFolderName", blue)
fg("NvimTreeEmptyFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fg("NvimTreeEndOfBuffer", darker_black)

cmd("hi NvimTreeRootFolder gui=underline guifg=" .. red)
bg("NvimTreeNormal", darker_black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", grey)

-- dashboard

fg("DashboardHeader", grey_fg)
fg("DashboardCenter", grey_fg)
fg("DashboardShortcut", grey_fg)
fg("DashboardFooter", grey_fg)

if vim.g.transparency then
   bg("Normal", "NONE")
   bg("Folded", "NONE")
   fg("Folded", "NONE")
   bg("NvimTreeNormal", "NONE")
   bg("NvimTreeVertSplit", "NONE")
   fg("NvimTreeVertSplit", grey)
   bg("NvimTreeStatusLineNC", "NONE")
   fg("Comment", grey)
end

-- For floating windows
bg("NormalFloat", one_bg)
fg("FloatBorder", blue)
