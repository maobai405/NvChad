return {
  -- 快捷跳转光标位置 https://github.com/folke/flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "光标跳转(flash) Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "光标跳转(flash) Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "光标跳转(flash) Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "光标跳转(flash) Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "光标跳转(flash) Toggle Flash Search" },
    },
  },

  -- 加速jk移动 https://github.com/rainbowhxch/accelerated-jk.nvim
  {
    "rainbowhxch/accelerated-jk.nvim",
    lazy = false,
    keys = require "configs.editor.accelerated-jk"["keys"],
    opts = require "configs.editor.accelerated-jk"["config"],
  },

  -- Zellij integration https://github.com/Lilja/zellij.nvim
  {
    "Lilja/zellij.nvim",
    keys = {
      { "<A-CR>", "<Cmd>ZellijNewTab<CR>", desc = "Zellij 创建新的Zellij tab" }
    },
    opts = {},
  },


  -- 缓冲区的Git集成 https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    event = { "CursorHold", "CursorHoldI" },
    opts = require "configs.editor.gitsigns",
  },
}
