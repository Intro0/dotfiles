return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(highlights, colors)
      -- Tab bar transparency
      highlights.TabLine = { bg = "NONE" }
      highlights.TabLineFill = { bg = "NONE" }
      highlights.TabLineSel = { bg = "NONE" }
      
      -- Status line transparency
      highlights.StatusLine = { bg = "NONE" }
      highlights.StatusLineNC = { bg = "NONE" }
    end,
  },
}
