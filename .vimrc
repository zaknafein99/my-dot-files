set nocompatible
set clipboard=unnamed
set number
set relativenumber
"==PLUGINS==
"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
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
"Plug 'hallettj/jslint.vim'
Plug 'ternjs/tern_for_vim'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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


"==VIM-JAVASCRIPT==
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1


syntax enable
set background=dark  
colorscheme solarized
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
"endif                                                                               
                                                                                    
" If linux then set ttymouse                                                        
let s:uname = system("echo -n \"$(uname)\"")                                        
if !v:shell_error && s:uname == "Linux" && !has('vim')                             
	set ttymouse=xterm
endif  



"PLUGIN CONFIG
"==================== NerdTree ====================                                 
" For toggling                                                                      
nmap <C-n> :NERDTreeToggle<CR>                                                      
noremap <Leader>n :NERDTreeToggle<cr>                                               
noremap <Leader>f :NERDTreeFind<cr>                                                 
let  NERDTreeShowHidden=1                                                            
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']                         

" Close nerdtree and vim on close file                                              
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif    

                                                                             
" =================== vim-airline ========================                          
                                                                                    
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")                                                  
if !g:remoteSession 
	let g:airline_powerline_fonts=1
endif                                                                               
" vim:ts=2:sw=2:et

let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
let $JS_CMD='node'

