local status_ok, telescopes = pcall(require, "telescope")
if not status_ok then
    return
end

require("telescope").setup({
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      file_ignore_patterns = {
        "vendor",
        ".git",
      },
    },
    live_grep = {
      hidden = true,
      ignore = false,
      only_sort_text = true,
      file_ignore_patterns = {
        "vendor",
        ".git",
      },
    },
  },
})
