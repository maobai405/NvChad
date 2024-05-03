local map = vim.keymap.set
local Utils = require("utils")

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- global lsp mappings
-- map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "lsp prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "lsp next diagnostic" })
-- map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- toggleable terminal
map({ "n", "t" }, "<C-\\>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "终端(terminal) close term in terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "快捷键(whichkey) 查找快捷键" })

-- add yours here

-- 调用easydict翻译快捷键
map({ "n", "v" }, "<leader>ts", function()
  local mode = vim.fn.mode()
  local selected_text = Utils.get_text(mode)
  selected_text = Utils.encodeURL(selected_text)
  os.execute("open easydict://" .. selected_text)
  vim.api.nvim_input("<Esc>")
  vim.api.nvim_input("<Esc>")
end, { desc = "翻译" })

-- 快速查询单词
map("n", "?", "*")

map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit 全部退出" })

-- 光标移动
map({ "n", "v" }, "<leader>h", "^", { desc = "光标(Cursor) 光标移动到行首" })
map({ "n", "v" }, "<leader>l", "$", { desc = "光标(Cursor) 光标移动到行尾" })

-- 移动行
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffer 移动
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer 上一个 Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Buffer 下一个 Buffer" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "窗口(Window) 切换到其他窗口", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "窗口(Window) 删除窗口", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "窗口(Window) 上下分割窗口", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "窗口(Window) 左右分割窗口", remap = true })

-- 快速打开光标后的第一个 url
map('n', 'gx', function()
  Utils.system_open_link()
end, { desc = 'open url' })
