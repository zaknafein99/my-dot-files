set number
set relativenumber


"==PLUGINS==
"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/tComment'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

syntax enable
set background=dark
colorscheme solarized
set wrap                                                                            
set textwidth=79                                                                    
set formatoptions=qrn1

" In many terminal emulators the mouse works just fine, thus enable it.             
if has('mouse')                                                                     
	set mouse=a
endif                                                                               
                                                                                    
" If linux then set ttymouse                                                        
let s:uname = system("echo -n \"$(uname)\"")                                        
if !v:shell_error && s:uname == "Linux" && !has('nvim')                             
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
                                                                                    
"let g:airline_theme='badwolf'
let g:airline_solarized_bg='dark'
 " set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")                                                  
if !g:remoteSession 
	let g:airline_powerline_fonts=1
endif                                                                               
" vim:ts=2:sw=2:et
