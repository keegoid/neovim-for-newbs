return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                  __]],
      [[     ___     ___    ___   __  __ /\_\    ___ ___]],
      [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
      [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
      [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("SPC f n", "  New file", "<cmd>enew<cr>"),
      dashboard.button("SPC f f", "󰈞  Find file", "<cmd>Telescope find_files<cr>"),
      dashboard.button("SPC f r", "󰋚  Recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("SPC e f", "󰙅  File explorer", "<cmd>Neotree filesystem reveal left<cr>"),
      dashboard.button("SPC e o", "󰏇  Oil file editor", "<cmd>Oil --float<cr>"),
      dashboard.button("SPC f g", "󰱼  Search text", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("SPC s k", "󰌌  Keymaps", "<cmd>NewbsKeys<cr>"),
      dashboard.button("SPC s H", "󰋖  Help", "<cmd>NewbsHelp<cr>"),
      dashboard.button("SPC s h", "󰒡  Check health", "<cmd>checkhealth<cr>"),
      dashboard.button("SPC s l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("SPC q q", "󰗼  Quit", "<cmd>quit<cr>"),
    }

    dashboard.section.footer.val = "Press <Space> and pause for the full keymap menu"

    alpha.setup(dashboard.opts)

    local function is_floating_window(win)
      return vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_config(win).relative ~= ""
    end

    local function focus_regular_window()
      local current = vim.api.nvim_get_current_win()
      if not is_floating_window(current) then
        return true
      end

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if not is_floating_window(win) then
          return pcall(vim.api.nvim_set_current_win, win)
        end
      end

      return false
    end

    local function close_floating_windows()
      focus_regular_window()

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if is_floating_window(win) then
          pcall(vim.api.nvim_win_close, win, true)
        end
      end
    end

    local function open_dashboard()
      close_floating_windows()
      pcall(vim.cmd, "silent only")
      vim.cmd.Alpha()
    end

    vim.keymap.set("n", "<leader>a", open_dashboard, { desc = "Return to dashboard", silent = true })

    -- wipe the alpha buffer when leaving so it never lingers as a split
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function(event)
        vim.bo[event.buf].bufhidden = "wipe"
      end,
    })
  end,
}
