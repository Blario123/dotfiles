" vim default setup commands

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set autoindent
set number
set wildmode=longest,list,full
set wildmenu
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set termguicolors
set laststatus=3
set ww+=<,>
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

" Setup wilder to use a vertical list with rounded borders

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.xsd'
let g:closetag_filetypes = 'html,xhtml,phtml,xml,xsd'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

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

syntax on
colorscheme monokai

lua << END
require('lualine').setup {
    options = { theme = 'onedark' }
}
END

" Keybind section. Leader is set to 'v'
let g:mapleader = ','
nnoremap <leader>n :NERDTreeFocus<CR>

imap <C-n> :call ToggleNumbering()<cr>

function! ToggleNumbering()
    if &numberingOn
        set rnu!
        setlocal numberingOn=0
    else
        set rnu
        setlocal numberingOn=4
    endif
endfunction
