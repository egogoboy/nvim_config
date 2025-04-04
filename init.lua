local vim = vim
local Plug = vim.fn['plug#']

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("map <C-n> :NERDTreeToggle<CR>")
vim.cmd("map <C-t> :Telescope find_files<CR>")
vim.cmd("map <C-b> :lua require'dap'.toggle_breakpoint()")

vim.call('plug#begin')

  Plug('neoclide/coc.nvim', {['branch'] = 'release'})
  Plug('neoclide/coc-java', {['do'] = 'yarn install --frozen-lockfile'})
  Plug('xiyaowong/transparent.nvim')
  Plug('preservim/nerdtree')
  Plug('folke/tokyonight.nvim')
  Plug('catppuccin/nvim')
  Plug('rose-pine/neovim')
  Plug('catppuccin/nvim')
  Plug('AlexvZyl/nordic.nvim')
  Plug('vim-airline/vim-airline')
  Plug('vim-airline/vim-airline-themes')
  Plug('windwp/nvim-autopairs')
  Plug('preservim/nerdcommenter')
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })
  Plug('mfussenegger/nvim-dap')

vim.call('plug#end')

require('nvim-autopairs').setup {
  enable_check_bracket_line = false,
  map_cr = false
}

vim.cmd('let g:airline_powerline_fonts = 1')
vim.cmd("let g:airline_theme='deus'")

require('settings.plugins.colorschemes.catppuccin')
require('settings.plugins.coc-nvim')
require('settings.plugins.telescope')

-- Настройка coc-java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.bo.omnifunc = "coc#refresh"
    vim.bo.formatexpr = "CocAction('formatSelected')"
  end
})
-- vim.opt.clipboard:append("unnamedplus")

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

