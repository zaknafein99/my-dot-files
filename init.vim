"==Wraps config so it does not load if using VS Code Neovim plugin==
if !exists('g:vscode')
	set nocompatible
	set clipboard+=unnamedplus
	set number
	set relativenumber
	let mapleader = " "
	set splitbelow
	set splitright
	let $PAGER=''
	"==REMOVES THE SHOW MODE UNDER AIRLINE STATUS BAR
	set noshowmode
	"==A script for cleaning the registers
	command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

	"==SET tab completion==
	"imap <Tab> <C-P>

	"==REMAP OF SPLITS==
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	"==PLUGINS==

	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'mattn/emmet-vim'
	Plug 'vim-scripts/tComment'
	Plug 'leafgarland/typescript-vim'
	Plug 'pangloss/vim-javascript'
	Plug 'Townk/vim-autoclose'
	Plug 'vim-syntastic/syntastic'
	Plug 'Quramy/tsuquyomi'
	Plug 'jiangmiao/auto-pairs'
	Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'ternjs/tern_for_vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'
	Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'mcchrish/nnn.vim'
	Plug 'vifm/vifm.vim'
	Plug 'ap/vim-css-color'
	"==Color Schemes
	Plug 'altercation/vim-colors-solarized'
	Plug 'aradunovic/perun.vim'
	Plug 'rakr/vim-one'
	Plug 'joshdick/onedark.vim'
	Plug 'gosukiwi/vim-atom-dark'
	Plug 'dracula/vim', { 'as': 'dracula' }
	call plug#end()

	"==AIRLINE CONFIG
	let g:lightline = {
		\ 'colorscheme': 'darcula',
		\ 'active': {
		\ 'left': [ [ 'mode', 'paste' ],
		\     [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		\ },
		\ 'component_function': {
		\   'gitbranch': 'FugitiveHead'
		\ },
	\ }

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:tsuquyomi_disable_quickfix = 1
	let g:syntastic_typescript_checkers = ['tsuquyomi'] 
	let g:syntastic_javascript_checkers = ['eslint']
	let g:syntastic_javascript_eslint_exe = 'npm run lint --'


	map <C-v> :Vifm<CR>
	map <Leader>vv :Vifm<CR>
	map <Leader>vs :VsplitVifm<CR>


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

	" "==JavaComplete2==
	" autocmd FileType java setlocal omnifunc=javacomplete#Complete
        "
	" "To enable smart (trying to guess import option) inserting class imports with F4, add:
	" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
	" imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
        "
	" "To enable usual (will ask for import option) inserting class imports with F5, add:
	" nmap <F5> <Plug>(JavaComplete-Imports-Add)
	" imap <F5> <Plug>(JavaComplete-Imports-Add)
        "
	" "To add all missing imports with F6:
	" nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
	" imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
        "
	" "To remove all unused imports with F7:
	" nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
	" imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
        "
	" "Default Mappings
	" nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
	" nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
	" nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
	" nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
        "
	" imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
	" imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
	" imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
	" imap <C-j>ii <Plug>(JavaComplete-Imports-Add)
        "
	" nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)
        "
	" imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)
        "
	" nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
	" nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	" nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	" nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
	" nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
	" nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
	" nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
	" nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)
        "
	" imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
	" imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
	" imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
        "
	" vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	" vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	" vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
        "
	" nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
	" nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)


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
	let g:ntrw_winsize = 25
	" augroup ProjectDrawer
	" 	autocmd!
	" 	autocmd VimEnter * :Vexplore
	" augroup END
	"The next two lines causes vim to load really slow
	" let g:netrw_list_hide=netrw_gitignore#Hide()
	" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

	" =================== vim-airline ========================                          
											    
	" let g:airline_theme='luna'
	let g:airline_theme='dracula'
	" let g:airline_solarized_bg='dark'
	let g:airline_powerline_fonts=0

	" colorscheme perun
	colorscheme dracula

	" neovim
	set termguicolors

	let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
	let $JS_CMD='node'

"==Endif for config wrapping for VS Code
endif
