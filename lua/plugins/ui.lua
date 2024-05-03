return {
  -- 消息通知 https://github.com/rcarriga/nvim-notify
  {
    "rcarriga/nvim-notify",
    keys = require "configs.ui.notify"["keys"],
    opts = require "configs.ui.notify"["config"],
  },

  -- 消息、命令行和弹出菜单的UI https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    opts = require "configs.ui.noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- 改进了默认的vim.UI界面 https://github.com/stevearc/dressing.nvim
  {
    'stevearc/dressing.nvim',
    opts = {},
  },


  -- 缩进范围及动画 https://github.com/echasnovski/mini.indentscope
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "╎",
      draw = {
        animation = function()
          return 40
        end,
      },
      options = { try_as_border = true },
    },
  },

  -- 跳转平滑滚动 https://github.com/karb94/neoscroll.nvim
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    opts = require "configs.ui.neoscroll",
  },


}
