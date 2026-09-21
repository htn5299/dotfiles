local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "if &buftype != 'nofile' | checktime | endif",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  callback = function()
    local t = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. t)
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local buf = event.buf
    if vim.bo[buf].filetype ~= "gitcommit" and not vim.b[buf].last_loc then
      vim.b[buf].last_loc = true
      local m = vim.api.nvim_buf_get_mark(buf, '"')
      local n = vim.api.nvim_buf_line_count(buf)
      if m[1] > 0 and m[1] <= n then
        pcall(vim.api.nvim_win_set_cursor, 0, m)
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = { "help", "lspinfo", "man", "qf", "checkhealth", "gitsigns-blame", "trouble" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Angular template detection by project root (angular.json or nx.json)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("angular_filetype"),
  pattern = "*.html",
  callback = function(event)
    local root = vim.fs.find({ "angular.json", "nx.json" }, { upward = true, path = vim.fs.dirname(event.file) })[1]
    if root then
      vim.bo[event.buf].filetype = "htmlangular"
    end
  end,
})
