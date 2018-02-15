
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
Plug 'Townk/vim-autoclose'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 


syntax enable
set background=dark
let g:one_allow_italics = 1
colorscheme onedark
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
set wrap                                                                            
set textwidth=79                                                                    
set formatoptions=qrn1

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
                                                                                    
let g:airline_theme='one'
" let g:airline_solarized_bg='dark'
" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")                                                  
if !g:remoteSession 
	let g:airline_powerline_fonts=1
endif                                                                               
" vim:ts=2:sw=2:et

let g:ycm_server_python_interpreter = '/usr/bin/python3.6'


