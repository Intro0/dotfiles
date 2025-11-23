return {
  -- Configure graphics protocol support for Warp Terminal
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- Detect if we're running in Warp Terminal
      if vim.env.TERM_PROGRAM == "WarpTerminal" then
        -- Enable graphics protocol support for plugins that check for it
        vim.g.warp_graphics_protocol = "kitty"
        
        -- Set up graphics protocol detection for image plugins
        if vim.fn.has("nvim-0.10") == 1 then
          -- Modern Neovim: set up proper graphics detection
          vim.g.terminal_has_graphics = true
        end
      end
      
      return opts
    end,
  },
}
