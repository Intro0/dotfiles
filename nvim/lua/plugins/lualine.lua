-- Bubbles config for lualine with B4 and B6 separators
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    -- stylua: ignore
    local colors = {
      blue   = '#7aa2f7',  -- Tokyo Night blue
      cyan   = '#7dcfff',  -- Tokyo Night cyan
      black  = '#1a1b26',  -- Tokyo Night background
      white  = '#c0caf5',  -- Tokyo Night foreground
      red    = '#f7768e',  -- Tokyo Night red
      violet = '#bb9af7',  -- Tokyo Night purple
      green  = '#9ece6a',  -- Tokyo Night green
      grey   = '#414868',  -- Tokyo Night comment
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },  -- Swapped to blue
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.violet } },  -- Swapped to violet
      visual = { a = { fg = colors.black, bg = colors.green } },   -- Changed to green
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    return {
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch" },
        lualine_c = {
          "%=", --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
