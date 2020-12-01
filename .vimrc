call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jmcantrell/vim-virtualenv'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let c_minlines=500

inoremap <silent><expr> <c-space> coc#refresh()

set shiftwidth=2
set autoindent
set smartindent

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType html syn sync match htmlHighlight groupthere javaScript "<script"
autocmd FileType html syn region javaScript start=+<script\_[^>]*>+ keepend end=+</script\_[^>]*>+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
autocmd FileType javascript syn sync ccomment javaScriptComment
autocmd BufEnter * :syntax sync fromstart

syntax on
colorscheme onedark
set number
set redrawtime=10000000

syntax sync fromstart
syntax sync minlines=200
syntax sync maxlines=500
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey


