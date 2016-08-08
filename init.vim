function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" vim-plug setting

call plug#begin()

" Vim ariline plugin
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Vim colorschemes
Plug 'flazz/vim-colorschemes'

" Vim snippet
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" neomake
Plug 'neomake/neomake'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" Tcomment for commenting
Plug 'tomtom/tcomment_vim'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Surround
Plug 'tpope/vim-surround'

" DelimitMate for closing bracket
Plug 'Raimondi/delimitMate'

" Dbext for handling database
Plug 'vim-scripts/dbext.vim'

" Easymotion plugin
Plug 'easymotion/vim-easymotion'

" Devicons for nerdtree
Plug 'ryanoasis/vim-devicons'

" Vim Fugitive plugin for git
Plug 'tpope/vim-fugitive'

" Deoplete for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Java Omnicompletion
Plug 'artur-shaik/vim-javacomplete2'

" SuperTab
Plug 'ervandew/supertab'

" HardMode Plugin to learn
Plug 'wikitopian/hardmode'

call plug#end()

" Setting for display
set number "show line numbers
set matchtime=1 "show matching bracket for 0.2 sec
set matchpairs+=<:> "specially for html
" set showcmd "show typed command in status bar

" Setting for neomake
autocmd! BufWritePost * Neomake

" Setting for the airline
set laststatus=2 "to get buffertabs and insert tab below
let g:airline_powerline_fonts = 1 "to use powerline font
let g:airline#extensions#tabline#enabled = 1
let g:ariline#extensions#branch#enabled = 1

" Setting for tab
set expandtab "To insert space characters whenever the tab key is pressed
set tabstop=4 "To control the number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4 "To change the number of space characters inserted for indentation
set softtabstop=4 " makes the spaces feel like real tabs

" Setting color scheme
" colorscheme wombat256
colorscheme sol-term

" Setting for changing leader
let mapleader=" "

" Setting for search
set incsearch "get to the search object
set nohls "remove highlight from matching search object
set ignorecase "case insensitive searching
set smartcase "but becomes case sensitive if you type uppercase

" My Key Mapping
inoremap jj <Esc>| "for going in normal mode
nnoremap <silent> <F7> :e ~/.config/nvim/init.vim <cr>| "go to init.vim
nnoremap <silent> <leader>nt :NERDTreeToggle <cr>

" Trigger configuration for ultimatesnip.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" setting for delimitmate
let g:delimitMate_expand_cr = 2

" mouse setting for vim old setting was 'n'
set mouse=v

" setting for changing cursor in insert mode
" if has("autocmd")
"   au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
"   au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
"   au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
" endif
"

" optional test setting
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Setting for easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" -----------------------------------setting for easymotion ends-------------------

"Deoplete Setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
let g:deoplete#sources.coffee = ['buffer', 'tag', 'member', 'file', 'omni']
" let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'

"javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" guess Imports
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

"Omnicompletion preview window manage
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Creating a shorcut for make

nnoremap <silent> rr :make <CR>
