set shell=/bin/bash

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

"if has('vim_starting')
"  set runtimepath+=~/.vim
"endif
if empty($XDG_DATA_HOME)
  let $XDG_DATA_HOME = $HOME . '/.config'
endif

" syntax enable
set ts=2
" set number
set autoread

nmap <Tab> <Plug>Sneak_s
nmap <S-Tab> <Plug>Sneak_S
vmap <Tab> <Plug>Sneak_s
vmap <S-Tab> <Plug>Sneak_S

set t_Co=256                   " Explicitly tell Viw that the terminal supports 256 colors
if has('nvim')
  colorscheme onedark
else
  colorscheme jellybeans
endif

set nocompatible               " Be iMproved
filetype off                   " Required!

" from https://github.com/spf13/spf13-vim/blob/master/.vimrc
" if has('statusline')
"   set laststatus=2 " Always show the statusline
"   set laststatus=2
"   set showtabline=2
"   set guioptions-=e
"   " Broken down into easily includeable segments
"   set statusline=%<%f\    " Filename
"   set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} "  Git Hotness
"   set statusline+=\ [%{&ff}/%Y]            " filetype
"   set statusline+=\ [%{getcwd()}]          " current dir
"   set statusline+=%#warningmsg#
"   set statusline+=%{SyntasticStatuslineFlag()}
"   set statusline+=%*
"   let g:syntastic_enable_signs=1
"   set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" endif

let g:tablabel =
      \ "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
set encoding=utf-8             " Necessary to show Unicode glyphs

" change the mapleader from \ to ,
let mapleader=","

" Slime
" let g:slime_target = "screen"
" let g:slime_paste_file = "$HOME/.slime_paste"

" Ack
" let g:ackprg="ack -H --sort-files --column"

" Easy motion
" let g:EasyMotion_leader_key = '<leader><leader>'

" Gist
" let g:gist_open_browser_after_post = 1
" let g:gist_post_private = 1
let g:github_user = "gipsy"
let g:gist_token = "2d2b306d71c67ad8f97eaf88259e7f494ea55d0e"

" vim-slime sent command to tmux
" let g:slime_target = "tmux"

" for js
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>"

" FufFile
" map ,f :FufFile <CR>

"TagList
" nmap <silent> <leader>- :TagbarToggle<CR>
" nmap <leader>b :TagbarToggle<CR>
" let g:tagbar_ctags_bin = "/opt/boxen/homebrew/bin/ctags"
" set tags=./tags

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
nnoremap <F6> :GundoToggle<CR>

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
set cmdheight=2                  " better display for messages
set updatetime=300               " smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c                 " don't give |ins-completion-menu| messages.
set signcolumn=yes               " always show signcolumns
set visualbell                   " don't beep
set noerrorbells                 " don't beep
set nobackup
set nowritebackup
" set noswapfile
" set backup
" set writebackup
au BufWritePre * let &backupext = '%' . substitute(expand("%:p:h"), "/" , "%" , "g") . "%" . strftime("%Y.%m.%d.%H.%M.%S")
au VimLeave * !cp % ~/.vim_backups/$(echo %:p | sed 's/\(.*\/\)\(.*\)/\2\/\1/g' | sed 's/\//\%/g')$(date +\%Y.\%m.\%d.\%H.\%M.\%S).wq
set backupdir=~/.vim_backups/
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>
set mouse=a
autocmd filetype python set expandtab
" autocmd filetype html,xml set listchars-=tab:>.
autocmd FileType javascript set shiftwidth=2

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

" source $VIMRUNTIME/mswin.vim

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

if exists('veonim')

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> <c-n> :Veonim next-problem<cr>
nno <silent> <c-p> :Veonim prev-problem<cr>
endif

if has('nvim')
  "set runtimepath+=~/.config/nvim
  set termguicolors
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'tyru/caw.vim'
Plug 'tpope/vim-fugitive'
" Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'tpope/vim-haml'
" Plug 'slim-template/vim-slim'
" Plug 'kchmck/vim-coffee-script'
" Plug 'mileszs/ack.vim'
" Plug 'wavded/vim-stylus'
" Plug 'digitaltoad/vim-jade'
" Plug 'Lokaltog/vim-powerline'
" Plug 'stephenmckinney/vim-solarized-powerline'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/eleline.vim'
Plug 'wincent/command-t', {'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'}
" Plug 'kien/ctrlp.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/gist-vim'
" Plug 'majutsushi/tagbar'
" Plug 'corntrace/bufexplorer'
Plug 'mattn/webapi-vim'
" Plug 'Rykka/colorv.vim'
Plug 'sjl/gundo.vim'
" Plug 'moll/vim-node'
" Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
" Plug 'pangloss/vim-javascript'
" Plug 'ElmCast/elm-vim'
" Plug 'marijnh/tern_for_vim'
" Plug 'Raimondi/delimitMate'
" Plug 'maksimr/vim-jsbeautify.git'
" Plug 'jiangmiao/simple-javascript-indenter'
Plug 'Yggdroot/indentLine'
" Plug 'vim-scripts/Better-Javascript-Indentation'
Plug 'junegunn/vim-easy-align'
" Plug 'vim-scripts/SyntaxComplete'
Plug 'tpope/vim-surround'
" Themes repos
" Plug 'altercation/vim-colors-solarized'
" vim-scripts repos
" Plug 'L9'
" Plug 'FuzzyFinder'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-flagship'
" Plug 'jpalardy/vim-slime'
" Non git repos
" Plug 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
" syntastic
" Plug 'scrooloose/syntastic'
" Plug 'posva/vim-vue', { 'branch': 'performance-enhancement' }
Plug 'storyn26383/vim-vue'
" JS syntax, supports ES6
" Plug 'othree/yajs.vim', {
"             \   'for': ['javascript', 'vue']
"             \ }
" Plug 'sekel/vim-vue-syntastic'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'sheerun/vim-polyglot'
" let g:polyglot_disabled = ['vue']
" Use neocomplete.
" Plug 'Shougo/neocomplete.vim.git'
" Plug 'Shougo/neocomplcache'
" Plug 'Shougo/neosnippet.vim.git'
Plug 'justinmk/vim-sneak'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Plug 'vim-scripts/AutoComplPop'
Plug 'Shougo/unite.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " set runtimepath+=~/.local/share/nvim/plugged/deoplete.nvim
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  Plug 'neoclide/vim-node-rpc'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-denite'
  Plug 'liuchengxu/vim-clap'

endif
call plug#end()
"call coc#util#install()
source $HOME/.config/nvim/plug-config/coc.vim
let g:deoplete#enable_at_startup = 0

tnoremap <Esc> <C-\><C-n>
let g:asyncomplete_auto_popup = 0

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets#
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" autocmd User CocNvimInit call CocActionAsync('runCommand',
"   \ 'tsserver.watchBuild')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Highlight full name (not only icons). You need to add 
" this if you don't have vim-devicons and want highlight.
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" let g:NERDTreeLimitedSyntax = 1

" Automatically start language servers.
let g:LanguageClient_autoStart=1
let g:LanguageClient_serverCommands = {
  \ 'vue': ['vls']
  \ }

" let g:vue_disable_pre_processors=0
let g:vue_pre_processors = 'detect_on_enter'

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
inoremap <silent><expr> <c-space> coc#refresh()

" The caveat is that you should *never* use PlugUpgrade
delc PlugUpgrade

let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})

let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}

let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>

syntax on
" set relativenumber

" Vim syntax file
" Language: Vue.js
" Maintainer: Eduardo San Martin Morote

if exists("b:current_syntax")
  finish
endif

""
" Get the pattern for a HTML {name} attribute with {value}.
function! s:attr(name, value)
  return a:name . '=\("\|''\)[^\1]*' . a:value . '[^\1]*\1'
endfunction

""
" Check whether a syntax file for a given {language} exists.
function! s:syntax_available(language)
  return !empty(globpath(&runtimepath, 'syntax/' . a:language . '.vim'))
endfunction

""
" Register {language} for a given {tag}. If [attr_override] is given and not
" empty, it will be used for the attribute pattern.
" function! s:register_language(language, tag, ...)
"   let attr_override = a:0 ? a:1 : ''
"   let attr = !empty(attr_override) ? attr_override : s:attr('lang', a:language)
"
"   if s:syntax_available(a:language)
"     execute 'syntax include @' . a:language . ' syntax/' . a:language . '.vim'
"     unlet! b:current_syntax
"     execute 'syntax region vue_' . a:language
"           \ 'keepend'
"           \ 'start=/<' . a:tag . '\>\_[^>]*' . attr . '\_[^>]*>/'
"           \ 'end="</' . a:tag . '>"me=s-1'
"           \ 'contains=@' . a:language . ',vueSurroundingTag'
"           \ 'fold'
"   endif
" endfunction

" if !exists("g:vue_disable_pre_processors") || !g:vue_disable_pre_processors
"   call s:register_language('less', 'style')
"   call s:register_language('pug', 'template', s:attr('lang', '\%(pug\|jade\)'))
"   call s:register_language('slm', 'template')
"   call s:register_language('handlebars', 'template')
"   call s:register_language('haml', 'template')
"   call s:register_language('typescript', 'script', '\%(lang=\("\|''\)[^\1]*\(ts\|typescript\)[^\1]*\1\|ts\)')
"   call s:register_language('coffee', 'script')
"   call s:register_language('stylus', 'style')
"   call s:register_language('sass', 'style')
"   call s:register_language('scss', 'style')
" endif

syn region  vueSurroundingTag   contained start=+<\(script\|style\|template\)+ end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent
syn keyword htmlSpecialTagName  contained template
syn keyword htmlArg             contained scoped ts
syn match   htmlArg "[@v:][-:.0-9_a-z]*\>" contained


"Javascript-libraries-syntax
" let g:used_javascript_libs = 'jquery,underscore,requirejs'

"Tern settings
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'
let g:tern#is_show_argument_hints_enabled = 1

let g:syntastic_javascript_checkers = [ 'eslint' ]
" let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif

if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
  " let g:syntastic_vue_eslint_exec = local_eslint
endif
"
let g:vim_vue_plugin_load_full_syntax = 1
let g:syntastic_javascript_eslint_exec='[ -f $(npm bin)/eslint ] && $(npm bin)/eslint || eslint'
let g:syntastic_debug = 0
let g:syntastic_debug_file = "~/.syntastic.log"
let g:vim_vue_plugin_has_init_indent = 0
let g:loaded_syntastic_coffee_coffeelint_checker = 1
let g:JSLintHighlightErrorLine = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1

" IndentLine
let g:indentLine_color_term = 234

let g:SimpleJsIndenter_BriefMode = 1
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['sass', 'slim', 'jade']

" Fold Lines
" au FileType javascript call JavaScriptFold()

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" let g:neocomplete#enable_at_startup = 0
" Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 5
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" autocmd BufRead,BufNewFile *.nue setlocal filetype=vue.html.javascript.css

" let g:asyncomplete_auto_popup = 0
" omnicompletes
" au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
" au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
" au FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete
" au FileType java setl omnifunc=javacomplete#Complete
" au FileType python setl omnifunc=pythoncomplete#Complete
" au FileType xml setl omnifunc=xmlcomplete#CompleteTags
" au FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete
" if has("autocmd") && exists("+omnifunc")
"   autocmd Filetype *
"     \        if &omnifunc == "" |
"     \                setlocal omnifunc=syntaxcomplete#Complete |
"     \        endif
" endif

" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"   \ 'default' : '',
"   \ 'vimshell' : $HOME.'/.vimshell_hist',
"   \ 'scheme' : $HOME.'/.gosh_completions'
"   \ }

" Enable vue syntax highlight
" autocmd FileType vue syntax sync fromstart
" let g:vue_disable_pre_processors = 1

"" neocomplcache
" if filereadable(expand('~/.vimrc.neocomplcache'))
"   source ~/.vimrc.neocomplcache
" endif

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" " Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
" " let g:coc_snippet_next = '<tab>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
"
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" vmap <leader>p  <Plug>(coc-format-selected)
" nmap <leader>p  <Plug>(coc-format-selected)
"
" nmap <silent> <leader>dd <Plug>(coc-definition)
" nmap <silent> <leader>dr <Plug>(coc-references)
" nmap <silent> <leader>dj <Plug>(coc-implementation)
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction


" autocmd User CocNvimInit call CocAction('runCommand',
"   \ 'tsserver.watchBuild')
"
" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"     \ 'vue': ['vls']
"     \ }

" if executable('javascript-typescript-stdio')
"   let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
"   " Use LanguageServer for omnifunc completion
"   autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
" else
"   echo "javascript-typescript-stdio not installed!\n"
"   :cq
" endif

" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"       \ 'name': 'typescript-language-server',
"       \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"       \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"       \ 'whitelist': ['typescript'],
"       \ })
" endif

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" inoremap <silent><expr> <c-space> coc#refresh()


filetype plugin indent on     " Required!
"
" Brief help
" :PlugInstall(!)    - install(update) bundles
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles

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

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
let g:onedark_termcolors=256

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


" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
  set WatchForChangesAllFile
endfunction
