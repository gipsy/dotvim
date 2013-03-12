syntax enable
set number
set background="dark"
let g:solarized_termcolors=256
colorscheme solarized

set nocompatible               " Be iMproved
filetype off                   " Required!

" change the mapleader from \ to ,
let mapleader=","

" Slime
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"

map ,f :FufFile <CR>
map ,g :Ack <CR>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
 NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 NeoBundle 'https://github.com/scrooloose/nerdtree.git'
 NeoBundle 'https://github.com/tpope/vim-haml.git'
 NeoBundle 'https://github.com/bbommarito/vim-slim.git'
 NeoBundle 'https://github.com/mileszs/ack.vim.git'
 NeoBundle 'https://github.com/wavded/vim-stylus'
 NeoBundle 'https://github.com/digitaltoad/vim-jade.git'
 " Themes repos
 NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
 " vim-scripts repos
 NeoBundle 'L9'
 NeoBundle 'FuzzyFinder'
 NeoBundle 'https://github.com/tpope/vim-rails.git'
 NeoBundle 'https://github.com/jpalardy/vim-slime.git'
 " Non github repos
 NeoBundle 'git://git.wincent.com/command-t.git'
 " Non git repos
 NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
 NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

 " ...

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
