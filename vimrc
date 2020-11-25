" Troy's .vimrc
" Environment {{{
    " Identify platform {{{
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }}}
    " Basics {{{
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/bash
        endif
    " }}}
    " Windows Compatible {{{
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }}}
    
" }}}
" Vim-Plug {{{
  call plug#begin('~/.vim/plugged')
  "Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  " Markdown / Writing
" Plug 'junegunn/goyo.vim'
"  Plug 'vimwiki/vimwiki'
"  Plug 'reedes/vim-pencil'
"  Plug 'tpope/vim-markdown'
"  Plug 'jtratner/vim-flavored-markdown'
"  Plug 'ajorgensen/vim-markdown-toc'
  Plug 'itchyny/lightline.vim'
  Plug 'connorholyday/vim-snazzy'
  "Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"  Plug 'tpope/vim-vinegar'
"  Plug 'scrooloose/nerdcommenter'
"  Plug 'tpope/vim-surround'
"  Plug 'kkoomen/vim-doge'
"  Plug 'tpope/vim-repeat'
"  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'airblade/vim-gitgutter'
"  Plug 'tpope/vim-fugitive'
"  vim-gitbranch is temporary until i put beefier git support in
  Plug 'itchyny/vim-gitbranch'
  Plug 'farmergreg/vim-lastplace'
"  Plug 'mhinz/vim-startify'
"  Plug 'pangloss/vim-javascript'
  " Use release branch (recommend)
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " : CocInstall coc-clangd
  " : CocInstall coc-json
  " : CocInstall coc-html
  " : CocInstall coc-lists
  " : CocInstall coc-snippets
  call plug#end()
" }}}
" Vim UI {{{
    set tabpagemax=10               " Only show 10 tabs
    set noshowmode                  " Don't display the current mode
                                    " let lightline handle that
    set nocursorline                " Don't highlight current line
    "highlight clear SignColumn      " SignColumn should match background
    "highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number
    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif
    if has('statusline')
        set laststatus=2
        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set foldmethod=indent           " indent makes the most sense to me
    set foldlevelstart=10           " open most folds when starting
    set foldnestmax=10              " never ever write code this deeply nested

    " set list
    " set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }}}
" Formatting {{{
    "set modeline                    " it apperas that this is not a default on for neovim
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of two spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every two columns
    set softtabstop=2               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    "set splitright                  " Puts new vsplit windows to the right of the current
    "set splitbelow                  " Puts new split windows to the bottom of the current
" }}}
" Filetype customization {{{
    syntax enable
    filetype plugin on
    filetype indent on
    au FileType py set autoindent
    au FileType py set smartindent
    au FileType py set textwidth=79 " PEP-8 Friendly
" }}}
" UI Stuff {{{
"   color scheme

"   " something of a hack for hyper.js
    "if (has('termguicolors'))
    "    set termguicolors
    "endif

    set t_Co=256
    syntax enable
    "colorscheme default
    colorscheme snazzy
    let g:SnazzyTransparent = 1
    set background=dark

    " nvim hack, guicursor applies to terminal mode as well???
    " this disables changing the cursor to a thin vertical bar
    " when in insert mode
    set guicursor=

    " it seems that most colorschemes do cterm=none for comments, and
    " switching schemes will override this setting. i don't know enough
    " about how people really do things in the vim world to be comfortable
    " putting this in the color schemes as an override just yet.
    "highlight comment cterm=italic
" }}}
" Plugin additions {{{
  " lightline configuration
  let g:lightline = {
      \ 'colorscheme': 'snazzy',
      \ }
  "   \ 'active': {
  "   \   'left': [ [ 'mode', 'paste' ],
  "   \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  "   \ },
  "   \ 'component_function': {
  "   \   'gitbranch': 'gitbranch#name'
  "   \ },

  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" }}}
" Key remaps {{{
    " from vimtips wiki, syntax highlighting group under cursor
    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    " from https://dougblack.io/words/a-good-vimrc.html, toggle fold in normal
    nnoremap <space> za
    let mapleader = ","
" }}}
" vim:foldmethod=marker:foldlevel=10
