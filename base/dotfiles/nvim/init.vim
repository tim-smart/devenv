set nocompatible
set termguicolors
set t_ut=

" mouse
set mouse=a

" Try speed up python plugin
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" Tab indentation
set tabstop=4 shiftwidth=4

" local project rc files
set exrc
set secure

" vim-plug
call plug#begin()

" colorscheme plugins
Plug 'frankier/neovim-colors-solarized-truecolor-only'

" ui
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-bundler'
Plug 'dense-analysis/ale'
Plug 'clojure-vim/async-clj-omni'

Plug 'honza/vim-snippets'
Plug 'tim-smart/z-vim-snippets'

" indent plugins
Plug 'tpope/vim-sleuth'
Plug 'nathanaelkane/vim-indent-guides'

" language plugins
Plug 'HerringtonDarkholme/yats.vim'
Plug 'racer-rust/vim-racer', { 'for': ['rust'] }
Plug 'jparise/vim-graphql'
Plug 'pantsbuild/vim-pants'
Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
Plug 'tpope/vim-rails'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-fireplace'
Plug 'dmac/vim-cljfmt'
Plug 'fgsch/vim-varnish'
Plug 'digitaltoad/vim-pug'
Plug 'PProvost/vim-ps1'

" version control plugins
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" debugging plugins
Plug 'benjie/local-npm-bin.vim'
Plug 'tpope/vim-dispatch'

" editing plugins
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'janko-m/vim-test'
Plug 'rking/ag.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

" colors
syntax enable
set background=light
colorscheme solarized

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Line numbers
set number
set relativenumber
set signcolumn=yes

" Indentation
set smartindent
set textwidth=80
set colorcolumn=80

" wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore=.gems

" modeline
set modeline
set showcmd
set laststatus=2

" scroll
set scrolloff=3
set ruler

" For showing whitespace
" colors keywords:
set list
set listchars=tab:>-,trail:·,eol:¶

" temp files
set backupdir=~/.cache/vim/session
set directory=~/.cache/vim/session

" undotree
set history=10000
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
  set undodir=~/.cache/vim/undo
endif

nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" Incremental search highlighting
set incsearch

" nerdtree
map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" tags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.gutctags']

" go
let g:go_fmt_command = "goimports"

" vue
autocmd FileType vue syntax sync fromstart

" fzf
nnoremap <silent> <C-p> :FZF<CR>

" indent guide colors
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" paste mode
set pastetoggle=<F2>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"

" modeline
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ft=%s ts=%d sw=%d tw=%d %set :",
        \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" neoformat
let g:neoformat_enabled_ruby = ['rufo']

augroup my_neoformat
  autocmd!
  autocmd BufWritePre *.rb undojoin | Neoformat
  autocmd BufWritePre *.rake undojoin | Neoformat
augroup END

" rainbox parens
let g:rainbow_active = 0
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowToggle
augroup END

" === Coc.nvim === "

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Flutter
map <F5> :CocList --input=flutter commands<CR>

" clojure
let g:conjure_log_direction = "horizontal"
au BufRead,BufNewFile *.boot set filetype=clojure

" ALE
let g:ale_linters = {
\ 'html': [],
\ 'ruby': [],
\ 'sql': [],
\ }

" Fix vim dispatch
set shellpipe=2>&1\|\ tee\ 

" Split diffs vertically
set diffopt+=vertical

" go
autocmd BufWritePre *.go :call CocAction('organizeImport')
