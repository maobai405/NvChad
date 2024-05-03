return {
  -- 会话管理插件 https://github.com/folke/persistence.nvim
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "会话(Session) 恢复会话" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "会话(Session) 恢复最后一个会话" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "会话(Session) 不保存当前会话" },
    },
    opts = { options = vim.opt.sessionoptions:get() },

  },

  -- 快捷打开yazi https://github.com/DreamMaoMao/yazi.nvim
  {
    "DreamMaoMao/yazi.nvim",
    keys = {
      { "<leader>yz", "<cmd>Yazi<CR>", desc = "Yazi Toggle Yazi" },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

}
