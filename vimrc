" Simple init.vim that's compatible with Neovim and Vim

let g:Tabsize=4

" General options
let &tabstop=g:Tabsize
let &shiftwidth=g:Tabsize
set background=dark
set nobackup
set hidden
set clipboard=unnamedplus
set cmdheight=1
set completeopt=menuone,noselect
set conceallevel=0
set fileencoding=utf-8
set nohlsearch
set incsearch
set ignorecase
set mouse=a
set pumheight=10
set noshowmode
set showtabline=2
set laststatus=2
set smartcase
set splitbelow
set splitright
set noswapfile
set timeoutlen=1000
set undofile
set updatetime=300
set smartindent
set nowritebackup
set noexpandtab
set termguicolors
set cursorline
set number
set norelativenumber
set numberwidth=2
set signcolumn=yes
set nowrap
set foldmethod=indent
set foldlevelstart=99
set scrolloff=8
set sidescrolloff=12

" Netrw Options
let g:netrw_keepdir = 0
let g:netrw_banner  = 0
let g:netrw_hide    = 1
let g:netrw_winsize = 30

" Keybindings
noremap <Space> <Nop>
let g:mapleader=' '
let g:maplocalleader=' '

noremap Q <Nop>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-k> <C-u>zz
nnoremap <C-j> <C-d>zz

nnoremap <silent>Y y$
nnoremap <silent>D d$
nnoremap <silent>C c$
nnoremap <silent> <C-a> :normal ggVG<CR>

nnoremap <silent> L :bnext<CR>
nnoremap <silent> H :bprevious<CR>

nnoremap <silent> <leader>n :enew<CR>
nnoremap <silent> <leader>q :close<CR>
nnoremap <silent> <leader>x :bdelete<CR>
nnoremap <silent> <leader>X :bdelete!<CR>
nnoremap <silent> <leader>l :noh<CR>:echo<CR>

augroup NetrwKeys
	autocmd!
	autocmd FileType netrw
		\ nnoremap <buffer> <silent> cd :cd %<CR>
augroup END

nnoremap <silent> <leader>f :Lexplore<CR>

nnoremap <silent> <leader>W :%s/\s\+$//<CR>
nnoremap <silent> <leader>sh :split<CR>
nnoremap <silent> <leader>sv :vsplit<CR>
nnoremap <C-o> <C-w>w

inoremap <silent> <expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
inoremap <silent> <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
inoremap <silent> <expr> <CR>    pumvisible() ? ' ' : '<CR>'

vnoremap <silent> < <gv
vnoremap <silent> > >gv

xnoremap <silent> <C-k> :move '<-2<cr>gv-gv
xnoremap <silent> <C-j> :move '>+1<cr>gv-gv

syntax on

colors habamax
