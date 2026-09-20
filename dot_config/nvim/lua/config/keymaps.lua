local map = vim.keymap.set

local function fzf_from_tree(fn)
  return function()
    if vim.bo.filetype == "neo-tree" then
      vim.cmd.wincmd("l")
    end
    require("fzf-lua")[fn]()
  end
end

map("n", "<leader>e", "<cmd>Neotree reveal<cr>", { desc = "Explorer" })
map("n", "<leader>w", "<cmd>HopWord<cr>", { desc = "Hop to Word" })
map("n", "<leader>/", "<cmd>HopWord<cr>", { desc = "Hop" })

map("n", "<leader>ff", fzf_from_tree("files"), { desc = "Find Files" })
map("n", "<leader>fg", fzf_from_tree("live_grep"), { desc = "Live Grep" })
map("n", "<leader>fb", fzf_from_tree("buffers"), { desc = "Buffers" })
map("n", "<leader>fh", fzf_from_tree("help_tags"), { desc = "Help Tags" })

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<leader>cf", function()
  vim.g.autoformat = not vim.g.autoformat
  print("Format on save: " .. (vim.g.autoformat and "ON" or "OFF"))
end, { desc = "Toggle Format on Save" })
