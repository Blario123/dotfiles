" vim default setup commands

set autoindent
set expandtab
set hlsearch
set ignorecase
set laststatus=3
set mouse=v
set nocompatible
set number
set number relativenumber
set shiftwidth=4
set showmatch
set softtabstop=4
set tabstop=4
set termguicolors
set wildmenu
set wildmode=longest,list,full
set ww+=<,>

syntax on
filetype plugin indent on

" Begin Vim-Plug list

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tanvirtin/monokai.nvim'
Plug 'preservim/nerdtree'
Plug 'alvan/vim-closetag'
Plug 'MunifTanjim/nui.nvim'
Plug 'benlubas/wrapping-paper.nvim'
Plug 'johann2357/nvim-smartbufs'
Plug 'ojroques/nvim-hardline'

if has('nvim')
    function! UpdateRemotePlugins(...)
        let &rtp=&rtp
        UpdateRemotePlugins
    endfunction
    Plug 'gelguy/wilder.nvim', { 'do' : function('UpdateRemotePlugins') }
else
    Plug 'gelguy/wilder.nvim'
endif

call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.xsd'
let g:closetag_filetypes = 'html,xhtml,phtml,xml,xsd'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Setup wilder to use a vertical list with rounded borders

call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option(
    \ 'renderer', wilder#popupmenu_renderer({
    \ 'highlighter': wilder#basic_highlighter(),
    \ }))
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
    \ 'highlights' : {
    \   'border': 'Normal',
    \ },
    \ 'border': 'rounded',
    \ })))

" Set colorscheme and theme for lualine

colorscheme monokai

" Keybindings

let g:mapleader = ','
nnoremap <leader>n :NERDTreeFocus<CR>

" Use , [1-9] to change to a tab

nnoremap <Leader>1  :lua require("nvim-smartbufs").goto_buffer(1)<CR>
nnoremap <Leader>2  :lua require("nvim-smartbufs").goto_buffer(2)<CR>
nnoremap <Leader>3  :lua require("nvim-smartbufs").goto_buffer(3)<CR>
nnoremap <Leader>4  :lua require("nvim-smartbufs").goto_buffer(4)<CR>
nnoremap <Leader>5  :lua require("nvim-smartbufs").goto_buffer(5)<CR>
nnoremap <Leader>6  :lua require("nvim-smartbufs").goto_buffer(6)<CR>
nnoremap <Leader>7  :lua require("nvim-smartbufs").goto_buffer(7)<CR>
nnoremap <Leader>8  :lua require("nvim-smartbufs").goto_buffer(8)<CR>
nnoremap <Leader>9  :lua require("nvim-smartbufs").goto_buffer(9)<CR>

" Use Ctrl Left/Right to move between tabs

nnoremap <C-Right>  :lua require("nvim-smartbufs").goto_next_buffer()<CR>
nnoremap <C-Left>   :lua require("nvim-smartbufs").goto_prev_buffer()<CR>

nnoremap <Leader>c1 :lua require("nvim-smartbufs").goto_terminal(1)<CR>
nnoremap <Leader>c2 :lua require("nvim-smartbufs").goto_terminal(2)<CR>
nnoremap <Leader>c3 :lua require("nvim-smartbufs").goto_terminal(3)<CR>
nnoremap <Leader>c4 :lua require("nvim-smartbufs").goto_terminal(4)<CR>

nnoremap <Leader>qq :lua require("nvim-smartbufs").close_current_buffer()<CR>

lua << END
require('lualine').setup {
    options = { theme = 'onedark' }
}

require('hardline').setup {
    bufferline = true,
    bufferline_settings = {
        exclude_terminal = false,
        show_index = true,
    },
    theme = 'default',
}

vim.keymap.set("n", "gww", require("wrapping-paper").wrap_line, { desc = "fake wrap current line" } )

END
