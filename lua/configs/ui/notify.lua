local M = {}

M["keys"] = {
  {
    "<leader>un",
    function()
      require("notify").dismiss({ silent = true, pending = true })
    end,
    desc = "Notify 清空所有的通知",
  },
}

M["config"] = {
  background_colour = "#000000",
}

return M
