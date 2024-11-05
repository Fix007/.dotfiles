local telescope = require "telescope"
telescope.setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },
    sorting_strategy = "ascending",
  },
  pickers = {
    live_grep = {
      file_ignore_patterns = { "node_modules/*", ".git/*", ".venv/*" },
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
    find_files = {
      file_ignore_patterns = { "node_modules/*", ".git/", ".venv/*" },
      hidden = true,
    },
  },
  -- extensions = {
  --   "fzf",
  -- },
}
-- telescope.load_extension "fzf"
