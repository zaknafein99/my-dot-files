set nocompatible
set clipboard=unnamed
set number
set relativenumber
let mapleader = " "

"==PLUGINS==

call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'aradunovic/perun.vim'
<<<<<<< HEAD
" Plug 'scrooloose/nerdtree'
=======
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
>>>>>>> dd3dc3db703b4f2389f88696032d3328db781f5e
Plug 'mattn/emmet-vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/tComment'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'Townk/vim-autoclose'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ternjs/tern_for_vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-vinegar'

call plug#end()
"==PLUGIN CONFIG==
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"==VIM-JAVASCRIPT==
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1

" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1


syntax enable
" set background=dark  
" colorscheme solarized
let g:one_allow_italics = 1
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
set wrap                                                                            
set textwidth=79                                                                    
set formatoptions=qrn1

nnoremap <silent> <ESC>OA <UP>

nnoremap <silent> <ESC>OB <DOWN>

nnoremap <silent> <ESC>OC <RIGHT>

nnoremap <silent> <ESC>OD <LEFT>

inoremap <silent> <ESC>OA <UP>

inoremap <silent> <ESC>OB <DOWN>

inoremap <silent> <ESC>OC <RIGHT>

inoremap <silent> <ESC>OD <LEFT>

" In many terminal emulators the mouse works just fine, thus enable it.             
"if has('mouse')                                                                     
set mouse=a

                                                                             
"==================== Netrw File Browser ====================                                 
let g:netrw_banner=0		"disable top banner"
let g:netrw_browse_split=4	"open in prior window"
let g:netrw_altv=1		"open splits to the right"
let g:netrw_liststyle=3		"tree view"
"The next two lines causes vim to load really slow
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" =================== vim-airline ========================                          

colorscheme one-dark

let g:airline_theme='luna'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1

colorscheme perun

" neovim
set termguicolors

let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
let $JS_CMD='node'

