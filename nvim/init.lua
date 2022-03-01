-- this block is to display the current time and date in bottom vim very necessary for me
vim.api.nvim_exec([[
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-24(%c%V%)\ %P%)
]], true)
require('windowsStuff')
require('treesitter')
-- netrw configs

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

vim.cmd([[
let g:netrw_bufsettings = 'nu rnu'
]])
-- netrw configs end

vim.cmd('colorscheme gruvbox')
local TAB_WIDTH = 4

vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>dt', '<cmd>r !date<cr>0i', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>pwd', '<cmd>r !pwd<cr>0i', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>ex', '<cmd>Explore<cr>', {noremap = true}) 
vim.opt.tabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true
vim.wo.colorcolumn = "80"
vim.wo.relativenumber = true
vim.wo.number = true
vim.g.guifont = "JetBrains Mono 13"


vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap=true})

require('LspConfig')

return require('packer').startup(function()
    use 'morhetz/gruvbox'
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'nvim-telescope/telescope.nvim', requires = {{ 'nvim-lua/plenary.nvim' }}
    }
    use 'tpope/vim-commentary'
    use 'mfussenegger/nvim-jdtls'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'ray-x/lsp_signature.nvim'
    use 'neovim/nvim-lspconfig'
end)

