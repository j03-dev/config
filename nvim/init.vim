syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set mouse=a
set relativenumber
set clipboard=unnamed
set termguicolors
set scrolloff=20

""" key map setting
map S : source ~/.config/nvim/init.vim <CR>
map T : term <CR>
" map T: Telescope finde_files <CR>
map B : !python3 /mnt/D/Project/Pybuild/pybuild.py -f % <CR>
map E : NERDTree <CR>
map & : mksession! ~/.mysession.vim <CR>
map ^ : source ~/.mysession.vim <CR>
map F : Files <CR>


call plug#begin('~/.nvim/plugin')

Plug 'vim-python/python-syntax'
" Plug 'ycm-core/YouCompleteMe'
Plug 'glench/vim-jinja2-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'sindrets/diffview.nvim'
Plug 'preservim/nerdcommenter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Color shemes
Plug 'morhetz/gruvbox'
Plug 'https://github.com/arzg/vim-colors-xcode'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'name': 'dracula' }

Plug 'vim-utils/vim-man'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'https://github.com/Townk/vim-autoclose.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

"" copilote nvim
Plug 'https://github.com/github/copilot.vim'

"" git grap
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

call plug#end()

" set compteteopt=preview
nmap <leader>yd <plug>(YCMHover)
nnoremap <leader>yD :YcmCompleter GetDoc<CR>
let g:ycm_auto_hover = '' " disable auto popups

let g:python_highlight_all=1
" colorscheme setting
set background=dark
set t_Co=256
set cursorline
colorscheme gruvbox
let g:airline_theme='solarized'
filetype plugin on

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup autoTrimWhitespace
	autocmd!
	autocmd! BufWritePre * :call TrimWhitespace()
augroup END

