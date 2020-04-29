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
	Plug 'mattn/emmet-vim'
	Plug 'vim-scripts/tComment'
	Plug 'leafgarland/typescript-vim'
	Plug 'pangloss/vim-javascript'
	Plug 'Townk/vim-autoclose'
	Plug 'vim-syntastic/syntastic'
	Plug 'Quramy/tsuquyomi'
	Plug 'jiangmiao/auto-pairs'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'ternjs/tern_for_vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-vinegar'
	Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'mcchrish/nnn.vim'
	Plug 'vifm/vifm.vim'
	Plug 'ap/vim-css-color'
	Plug 'liuchengxu/vim-which-key'
	"==Color Schemes
	Plug 'altercation/vim-colors-solarized'
	Plug 'aradunovic/perun.vim'
	Plug 'rakr/vim-one'
	Plug 'joshdick/onedark.vim'
	Plug 'gosukiwi/vim-atom-dark'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'morhetz/gruvbox'
	Plug 'shinchu/lightline-gruvbox.vim'
	call plug#end()

	"==AIRLINE CONFIG
	let g:lightline = {
		\ 'colorscheme': 'gruvbox',
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

	"==Vim-which-key==
	" Define prefix dictionary
	let g:which_key_map =  {}

	" Second level dictionaries:
	" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
	" Unnamed groups will show a default empty string.

	" =======================================================
	" Create menus based on existing mappings
	" =======================================================
	" You can pass a descriptive text to an existing mapping.

	let g:which_key_map.f = { 'name' : '+file' }

	nnoremap <silent> <leader>fs :update<CR>
	let g:which_key_map.f.s = 'save-file'

	nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
	let g:which_key_map.f.d = 'open-vimrc'

	nnoremap <silent> <leader>oq  :copen<CR>
	nnoremap <silent> <leader>ol  :lopen<CR>
	let g:which_key_map.o = {
	      \ 'name' : '+open',
	      \ 'q' : 'open-quickfix'    ,
	      \ 'l' : 'open-locationlist',
	      \ }

	" =======================================================
	" Create menus not based on existing mappings:
	" =======================================================
	" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.) and descriptions for existing mappings
	let g:which_key_map.b = {
	      \ 'name' : '+buffer' ,
	      \ '1' : ['b1'        , 'buffer 1']        ,
	      \ '2' : ['b2'        , 'buffer 2']        ,
	      \ 'd' : ['bd'        , 'delete-buffer']   ,
	      \ 'f' : ['bfirst'    , 'first-buffer']    ,
	      \ 'h' : ['Startify'  , 'home-buffer']     ,
	      \ 'l' : ['blast'     , 'last-buffer']     ,
	      \ 'n' : ['bnext'     , 'next-buffer']     ,
	      \ 'p' : ['bprevious' , 'previous-buffer'] ,
	      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
	      \ }

	let g:which_key_map.l = {
	      \ 'name' : '+lsp',
	      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
	      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
	      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
	      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
	      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
	      \ 'g' : {
		\ 'name': '+goto',
		\ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
		\ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
		\ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
		\ },
	      \ }



	nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
		set timeoutlen=500
		let g:which_key_map['w'] = {
		      \ 'name' : '+windows' ,
		      \ 'w' : ['<C-W>w'     , 'other-window']          ,
		      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
		      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
		      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
		      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
		      \ 'h' : ['<C-W>h'     , 'window-left']           ,
		      \ 'j' : ['<C-W>j'     , 'window-below']          ,
		      \ 'l' : ['<C-W>l'     , 'window-right']          ,
		      \ 'k' : ['<C-W>k'     , 'window-up']             ,
		      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
		      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
		      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
		      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
		      \ '=' : ['<C-W>='     , 'balance-window']        ,
		      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
		      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
		      \ '?' : ['Windows'    , 'fzf-window']            ,
		      \ }
		"==END WHICHKEY==


	" map <C-n> :NERDTreeToggle<CR>
	" let g:NERDTreeIndicatorMapCustom = {
	"     \ "Modified"  : "✹",
	"     \ "Staged"    : "✚",
	"     \ "Untracked" : "✭",
	"     \ "Renamed"   : "➜",
	"     \ "Unmerged"  : "═",
	"     \ "Deleted"   : "✖",
	"     \ "Dirty"     : "✗",
	"     \ "Clean"     : "✔︎",
	"     \ 'Ignored'   : '☒',
	"     \ "Unknown"   : "?"
	"     \ }

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

	"==COLORSCHEME==
	colorscheme gruvbox
	set background=dark
	" neovim
	set termguicolors

	let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
	let $JS_CMD='node'

"==Endif for config wrapping for VS Code
endif
