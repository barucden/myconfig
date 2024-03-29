local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('JuliaEditorSupport/julia-vim')
Plug('junegunn/vim-easy-align')
Plug('ellisonleao/gruvbox.nvim')
Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = vim.fn[':TSInstall']
})
Plug('ggandor/leap.nvim')

vim.call('plug#end')

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'light'
require("gruvbox").setup({ contrast = "hard" })
vim.cmd("colorscheme gruvbox")

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Show column and row number
vim.opt.ruler = true
-- Highlight the current line
vim.opt.cursorline = true
-- Always show the status line
vim.opt.laststatus = 2
-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Allow backspace over anything
vim.opt.backspace = 'indent,eol,start'
-- Allow unsaved buffers
vim.opt.hidden = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wildmenu = true
vim.opt.path:append('**')

-- Expand tabs into spaces
vim.opt.expandtab = true
-- Tab size
vim.opt.ts = 4
vim.opt.shiftwidth = 4

vim.opt.foldenable = false

-- Remove trailing spaces
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

-- Unbind annoying default keybind
vim.keymap.set('n', 'Q', '<Nop>')

-- List the available buffers and prepare :b
vim.keymap.set('n', '<Leader>b', ':ls<CR>:b<Space>')

-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')

require('nvim-treesitter.configs').setup {
    -- A list of parser names, or 'all'
    ensure_installed = { 'julia', 'python', 'latex' },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

}

require('leap').add_default_mappings()

-- Get rid of annoying indentation in TeX files
vim.cmd('au FileType tex setlocal indentexpr=')

