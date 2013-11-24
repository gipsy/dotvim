set nocompatible               " Be iMproved
set shell=/bin/bash

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " My Bundles here:
 "
 " Note: You don't set neobundle setting in .gvimrc!
syntax enable
set number
set background="dark"
let g:solarized_termcolors=256
"let g:Powerline_theme='short'
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"
let g:solarized_termtrans = 1
let g:Powerline_colorscheme='solarized256_dark'

let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_n = 'N'

set t_Co=256                   " Explicitly tell Viw that the terminal supports 256 colors
colorscheme solarized
"colorscheme jellybeans

set nocompatible               " Be iMproved
filetype off                   " Required!

" from https://github.com/spf13/spf13-vim/blob/master/.vimrc
if has('statusline')
  set laststatus=2 " Always show the statusline
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
    
set encoding=utf-8             " Necessary to show Unicode glyphs

" change the mapleader from \ to ,
let mapleader=","

" Slime
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"

" Ack
let g:ackprg="ack -H --sort-files --column"

" Easy motion
let g:EasyMotion_leader_key = '<leader><leader>'

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" vim-slime sent command to tmux
let g:slime_target = "tmux"

" FufFile
map ,f :FufFile <CR>

nmap <leader>b :TagbarToggle<CR>

" Open a new tab and search for something
nmap <leader>g :sp<CR>:Ack ""<Left>
nmap <leader>gv :vs<CR>:Ack ""<Left>
map ,s :update <CR>

" Immediatly search for the  word under the cursor
nmap <leader>G :tab split<CR>:Ack <C-r><C-w><CR>

" ESC
imap jj <Esc>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

set expandtab                    " use spaces instead of tabs
set smarttab                     " be smart when using tabs
set hidden
set nowrap                       " don't wrap lines
set tabstop=2                    " a tab is four spaces
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set autoindent                   " alwaps set autoindenting on
set copyindent                   " copy the previous indentation on autoindenting
set number                       " always show line numbers
set shiftwidth=2                 " number of spaces to use for autoindenting
set shiftround                   " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                    " set show matching parenthesis
set ignorecase                   " ignore case when searching
set smartcase                    " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                     " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                     " highlight search terms
set incsearch                    " show search matches as you type

set history=1000                 " remember more commands and search history
set undolevels=1000              " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                        " change the terminal's title
set visualbell                   " don't beep
set noerrorbells                 " don't beep
set nobackup
set noswapfile
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>
set mouse=a
autocmd filetype python set expandtab
autocmd filetype html,xml set listchars-=tab:>.

" Make j and k work normally for soft wrapped lines
nnoremap <buffer> j gj
nnoremap <buffer> k gk

" Make the arrow keys work like TextMate in instert mode
inoremap <down> <C-C>gja
inoremap <up> <C-C>gka

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
source $VIMRUNTIME/mswin.vim

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundle 'Shougo/neobundle.vim'

 " Recommended to install
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
 NeoBundle 'Shougo/vimproc'

 " My Bundles here:
 "
 " Note: You don't set neobundle setting in .gvimrc!
 " Original repos on github
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'scrooloose/nerdtree.git'
 NeoBundle 'tpope/vim-haml.git'
 NeoBundle 'slim-template/vim-slim.git'
 NeoBundle 'kchmck/vim-coffee-script.git'
 NeoBundle 'mileszs/ack.vim.git'
 NeoBundle 'wavded/vim-stylus'
 NeoBundle 'digitaltoad/vim-jade.git'
 NeoBundle 'Lokaltog/vim-powerline.git'
 NeoBundle 'stephenmckinney/vim-solarized-powerline'
 NeoBundle 'git@github.com:wincent/Command-T.git'
 NeoBundle 'kien/ctrlp.vim.git'
 NeoBundle 'airblade/vim-gitgutter.git'
 NeoBundle 'tomtom/tcomment_vim.git'
 NeoBundle 'mattn/gist-vim.git'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'corntrace/bufexplorer.git'
 NeoBundle 'twe4ked/vim-peepopen'
 NeoBundle 'mattn/webapi-vim'
 NeoBundle 'Rykka/colorv.vim.git'
 NeoBundle 'sjl/gundo.vim.git'
 NeoBundle 'moll/vim-node.git'
 NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
 NeoBundle 'git@github.com:marijnh/tern_for_vim.git'
 NeoBundle 'git@github.com:vim-scripts/JavaScript-Indent.git'
 " Themes repos
 NeoBundle 'altercation/vim-colors-solarized.git'
 " vim-scripts repos
 NeoBundle 'L9'
 " NeoBundle 'FuzzyFinder'
 NeoBundle 'tpope/vim-rails.git'
 NeoBundle 'jpalardy/vim-slime.git'
 " Non git repos
 NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
 " NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
 " syntastic
 NeoBundle 'git@github.com:scrooloose/syntastic.git'
 NeoBundle 'tpope/vim-surround.git'

 "Tern settings
 let g:tern_map_keys = 1
 let g:tern_show_argument_hints = 'on_hold'
 let g:tern#is_show_argument_hints_enabled = 1

 let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'php', 'javascript', 'coffee'],
  \ 'passive_filetypes': ['html', 'phtml'] }
 let g:syntastic_javascript_checkers = [ 'jshint', 'gjslint', 'jslint', 'jsl' ]
 let g:loaded_syntastic_coffee_coffeelint_checker = 1
 let g:JSLintHighlightErrorLine = 0
 let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
 let g:syntastic_auto_loc_list = 2
 let g:syntastic_check_on_open=1
 let g:syntastic_error_symbol='✗'
 let g:syntastic_warning_symbol='⚠'
 let g:syntastic_enable_balloons = 1

 " Fold Lines
 " au FileType javascript call JavaScriptFold()

 " Use neocomplete.
 NeoBundle 'git@github.com:Shougo/neocomplete.vim.git'
 let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3
 let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 " Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 " Enable heavy omni completion.
 if !exists('g:neocomplete#sources#omni#input_patterns')
   let g:neocomplete#sources#omni#input_patterns = {}
 endif
 " Define dictionary.
 let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

 "" neocomplcache
 " NeoBundle 'Shougo/neocomplcache'
 " if filereadable(expand('~/.vimrc.neocomplcache'))
 "   source ~/.vimrc.neocomplcache
 " endif

 "" neosnippet
 NeoBundle 'git@github.com:Shougo/neosnippet.vim.git'

 NeoBundle 'vim-scripts/AutoComplPop.git'

 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 if neobundle#exists_not_installed_bundles()
   echomsg 'Not installed bundles : ' .
         \ string(neobundle#get_not_installed_bundle_names())
   echomsg 'Please execute ":NeoBundleInstall" command.'
   "finish
 endif


"from Clarity group
"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
if !exists("b:statusline_trailing_space_warning")
if search('\s\+$', 'nw') != 0
let b:statusline_trailing_space_warning = '[\s]'
else
let b:statusline_trailing_space_warning = ''
endif
endif
return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
if !exists("b:statusline_long_line_warning")
let long_line_lens = s:LongLines()

if len(long_line_lens) > 0
let b:statusline_long_line_warning = "[" .
\ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
let threshold = (&tw ? &tw : 80)
let spaces = repeat(" ", &ts)

let long_line_lens = []

let i = 1
while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
let nums = sort(a:nums)
let l = len(nums)

if l % 2 == 1
let i = (l-1) / 2
return nums[i]
else
return (nums[l/2] + nums[(l/2)-1]) / 2
endif
endfunction
