return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua")
    vim.keymap.set('n', '<Leader>b', '<cmd>FzfLua buffers<CR>', { desc='Search Buffers', noremap=true, silent=true, nowait=true})
    vim.keymap.set('n', '<C-f>', '<cmd>FzfLua files<CR>', { desc='Search Files', noremap=true, silent=true, nowait=true})
    vim.keymap.set('n', '<Leader>f', '<cmd>FzfLua grep_project<CR>', { desc='RipGrep Files', noremap=true, silent=true, nowait=true})
    vim.keymap.set('n', '<Leader>\'', '<cmd>FzfLua marks<CR>', { desc='RipGrep Marks', noremap=true, silent=true, nowait=true})
    vim.keymap.set('n', '<Leader>g', '<cmd>FzfLua git_commits<CR>', { desc='Search Git Commits', noremap=true, silent=true, nowait=true})
    vim.keymap.set('n', '<Leader>t', '<cmd>FzfLua tabs<CR>', { desc='Search Tabs', noremap=true, silent=true, nowait=true})
  end,
}
