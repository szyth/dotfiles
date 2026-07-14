-- Fast reload using filesystem watcher
local uv = vim.uv or vim.loop
local function watch_file(bufnr)
  -- Safety check
  if type(bufnr) ~= "number" or not vim.api.nvim_buf_is_valid(bufnr) then return end
  
  local fname = vim.api.nvim_buf_get_name(bufnr)
  if fname == "" or not uv.fs_stat(fname) then return end
  
  local fsevent = uv.new_fs_event()
  fsevent:start(fname, {}, vim.schedule_wrap(function()
    if vim.api.nvim_buf_is_valid(bufnr) and vim.fn.getbufvar(bufnr, "&modified") == 0 then
      vim.cmd("checktime " .. bufnr)
    end
  end))
  
  vim.api.nvim_create_autocmd("BufUnload", {
    buffer = bufnr,
    once = true,
    callback = function() 
      if fsevent and not fsevent:is_closing() then fsevent:stop() end 
    end,
  })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args) watch_file(args.buf) end,
})