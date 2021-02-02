" File              : .vimrc
" Author            : Alexandre Saison <alexandre.saison@inarix.com>
" Date              : 28.12.2020
" Last Modified Date: 29.12.2020
" Last Modified By  : Alexandre Saison <alexandre.saison@inarix.com>
" Minimal Configuration
set nocompatible
set redrawtime=10000000

" save undo trees in files
set undofile
set undodir=~/.vim/undo

set number relativenumber


" number of undo saved
set undolevels=10000

syntax on
filetype plugin indent on

syntax sync fromstart
syntax sync minlines=200
syntax sync maxlines=500
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
colorscheme onedark

" Minimal Configuration for Terraform
" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#begin('~/.vim/plugged')

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigation / Autocompletion
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'jmcantrell/vim-virtualenv'

" Languages Servers
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform' " Terraform LanguageServer
Plug 'vim-syntastic/syntastic' " Syntax checking for terraform
Plug 'juliosueiras/vim-terraform-completion' "Terraform Completion

" Other
Plug 'habamax/vim-godot'
Plug 'alpertuna/vim-header' 
Plug 'sinetoami/vim-winresize'
" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

let g:airline_powerline_fonts = 1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1 "Show hidden files

let c_minlines=500

"GO MODULES 
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"

" auto header
let g:header_field_author = 'Alexandre Saison'
let g:header_field_author_email = 'alexandre.saison@inarix.com'
map > :AddHeader<CR>

" quit search mode
map <silent> < :noh<CR>

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> + :res +1<CR>
nmap <silent> _ :res -1<CR>

set shiftwidth=2
set autoindent
set smartindent

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType html syn sync match htmlHighlight groupthere javaScript "<script"
autocmd FileType html syn region javaScript start=+<script\_[^>]*>+ keepend end=+</script\_[^>]*>+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
autocmd FileType javascript syn sync ccomment javaScriptComment
autocmd BufEnter * :syntax sync fromstart

