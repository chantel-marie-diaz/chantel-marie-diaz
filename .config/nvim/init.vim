set nocompatible
" filetype off

" Vundle.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim' " vim plugin manager
Plugin 'preservim/nerdtree' " file directory tree
Plugin 'Xuyuanp/nerdtree-git-plugin' " shows git status of file directories
Plugin 'ryanoasis/vim-devicons' " icons for nerdtree / file directories
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " highlighting for file directories
Plugin 'jistr/vim-nerdtree-tabs' " nerdtree and tabs
Plugin 'itchyny/lightline.vim' " nice vim statusline
Plugin 'shmup/vim-sql-syntax' " highlights sql syntax better
Plugin 'chrisbra/csv.vim' " filetype plugin to view csv files
Plugin 'Yggdroot/indentLine' " adds indentation marks, used for yaml files
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file finder for vim
Plugin 'brooth/far.vim' " a fancier find and replace for vim
Plugin 'tyru/open-browser.vim' " open the browser from vim
Plugin 'tyru/open-browser-github.vim' " open a github file's url within vim
Plugin 'Konfekt/vim-alias' " alias command line arguments
Plugin 'mg979/vim-visual-multi', {'branch': 'master'} " cursors/ finding things
Plugin 'https://github.com/airblade/vim-gitgutter' " shows git diffs within vim
Plugin 'https://github.com/tpope/vim-surround' " surrounding code with text objects
Plugin 'https://github.com/tpope/vim-repeat' " easier remapping of command .
Plugin 'https://github.com/tpope/vim-commentary' " commenting out lines of code
Plugin 'https://github.com/tpope/vim-fugitive' " using git within vim
Plugin 'jayli/vim-easycomplete' " auto-completion for vim
Plugin 'SirVer/ultisnips' " code snippets that appear with vim-easycomplete
Plugin 'honza/vim-snippets' " code snippets that works with ultisnips
Plugin 'puremourning/vimspector' " for vscode like debugging
Plugin 'itchyny/vim-gitbranch' " shows what branch currently in vim using lightline
Plugin 'dense-analysis/ale' " linting engine, needs linters installed in env to work
Plugin 'nvie/vim-flake8' " runs flake8 in vim
Plugin 'pedrohdz/vim-yaml-folds' " creates folds in yaml file to open and close different sections
Plugin 'arcticicestudio/nord-vim' " for nice aesthetics
" A few manual steps in https://github.com/iamcco/markdown-preview.nvim
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Wilder Menu, a More Fancier wildmode.
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plugin 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plugin 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" Vundle Exec.
call vundle#end()
filetype plugin indent on

" Turning off - We Have Lightline Status.
set noshowmode

" Yaml Indentation.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
let g:indentLine_fileType = ['yaml']

" Wilder Menu Settings in Command Mode.
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ })))

call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))

" Lightline for Vim Status Line.
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Enable Type File Detection.
filetype on

" Enable Plugins and Load Plugin For the Detected File Type.
filetype plugin on

" Load an Indent File for the Detected File Type.
filetype indent on

" Add Numbers.
set number

" Spelling for My Typos.
set spell spelllang=en_us

" Highlight Cursor Line.
set cursorline

" Use Space Characters instead of Tab.
"set expandtab

" Incremental Highlight as You Type and Search Through File.
set incsearch

" Ignore Capital Letters During Search.
set ignorecase

" Override to Look for Capital Letters.
set smartcase

" Show Partial Command You Type in the Line.
set showcmd

" Show the mode you are on the last line
" set showmode

" Show Matching Words During Search.
set showmatch

" Use Highlighting When Doing Search.
set hlsearch

" To Toggle Highlights, Press F4 to Toggle Highlighting on/off, and Show Current Value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" Or to Get Out of Highlighted Search, Press return to Temporarily Get Out of the Highlighted Search.
:nnoremap <CR> :nohlsearch<CR><CR>

" Enable Autocompletion.
set wildmenu

" List Long.
set wildmode=longest

" Ignore Certain File Types in Wild Search.
" set wildignore=*.docx, *.jpg, *.png, *.gif, *pdf, *.pyc, *exe, *.flv

" Set No Wrap.
set nowrap

" Set Tabs as 2 Spaces.
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Access System Clipboard for Mac.
if has('macunix')
    set clipboard=unnamed
" Or for linux
else
    set clipboard=unnamedplus
endif

" Syntax Highlighting.
let python_highlight_all=1
syntax on

" Nord Theme for Vim.
colorscheme nord
highlight Comment ctermfg=LightGrey

" Ale Linting and Configuration.
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_hover_to_preview = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'autoflake','isort'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Vimspector for Debugging.
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Vim Easy Complete Menu Icons.
let g:easycomplete_menu_skin = {
      \   "buf": {
      \      "kind":"⚯",
      \      "menu":"[B]",
      \    },
      \   "snip": {
      \      "kind":"<>",
      \      "menu":"[S]",
      \    },
      \   "dict": {
      \      "kind":"d",
      \      "menu":"[D]",
      \    },
      \   "tabnine": {
      \      "kind":"",
      \    },
      \ }
" Vim Easy Complete Theme.
let g:easycomplete_scheme="sharp"

"Vim Easy Complete Fonts / Letters for Language Servers.
let g:easycomplete_lsp_type_font = {
      \ 'text' : '⚯',         'method':'m',    'function': 'f',
      \ 'constructor' : '≡',  'field': 'f',    'default':'d',
      \ 'variable' : '𝘤',     'class':'c',     'interface': 'i',
      \ 'module' : 'm',       'property': 'p', 'unit':'u',
      \ 'value' : '𝘧',        'enum': 'e',     'keyword': 'k',
      \ 'snippet': '𝘧',       'color': 'c',    'file':'f',
      \ 'reference': 'r',     'folder': 'f',   'enummember': 'e',
      \ 'constant':'c',       'struct': 's',   'event':'e',
      \ 'typeparameter': 't', 'var': 'v',      'const': 'c',
      \ 'operator':'o',
      \ 't':'𝘵',   'f':'𝘧',   'c':'𝘤',   'm':'𝘮',   'u':'𝘶',   'e':'𝘦',
      \ 's':'𝘴',   'v':'𝘷',   'i':'𝘪',   'p':'𝘱',   'k':'𝘬',   'r':'𝘳',
      \ 'o':"𝘰",   'l':"𝘭",   'a':"𝘢",   'd':'𝘥',
      \ }

" Ultisnips Triggers.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Copy and Paste Mappings.
vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc>P

" NERDTree Mappings.
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and Put the Cursor Back in the Other Window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the Only Window Remaining in the Only Tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTree and Interface Font, also Set in Terminator.
set guifont=Hasklug\ Nerd\ Font\ Mono\ Medium\ 11
set gfw=Hasklug\ Nerd\ Font\ Mono\ Medium\ 11
set encoding=UTF-8

" NERDTree Syntax.
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" NERDTree with Git Plugin Indicators.
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'♨',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" NERDTree Use NERD Fonts and Untracked.
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let NERDTreeShowHidden=1 " for those dotfiles

" Keep the Most Recently Pasted Item in Clipboard.
xnoremap p pgvy

" Autostart Git Gutter.
autocmd VimEnter * GitGutter

" Autoformat CSV on Open.
" Borrowed from: https://github.com/chrisbra/csv.vim/blob/master/csv.vmb
aug CSV_Editing
    au!
    au BufRead,BufWritePost *.csv :%ArrangeColumn
    au BufWritePre *.csv :%UnArrangeColumn
aug end

" Allow Mouse.
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" Highlight Trailing Whitespace.
function HighlightTrailingWhitespace()
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
endfunction
autocmd VimEnter,BufWritePost * call HighlightTrailingWhitespace()

" Show Flake8 Gutter.
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Patch XTERM Printing Weird Chars on Line 1
set t_TI= t_TE=

" Embed IPython in the Code to Automatically Run in Terminal.
function Embed()
  let line=line('.')
  let indent=indent(line)
  let pad = repeat(' ', indent)
  call append(line - 1, pad . 'from IPython import embed; embed()')
endfunction
command! Embed call Embed()

" Write Python Breakpoints.
function WritePyBreakpoint()
  let line=line('.')
  let indent=indent(line)
  let pad = repeat(' ', indent)
  call append(line - 1, pad . 'breakpoint()')
endfunction
command! WritePyBreakpoint call WritePyBreakpoint()
nmap <C-b><C-k> :WritePyBreakpoint<CR>

" Remove Python Breakpoints.
function RemovePyBreakpoints()
  exec ':g/breakpoint()/d'
endfunction
command! RemovePyBreakpoints call RemovePyBreakpoints()

" Git Show Hash under Cursor.
" When Doing an Interactive Rebase.
function RebaseViewer()
  let hash = expand("<cword>")
  let cmd = 'git show ' . hash
  echo cmd
  exec ':rightbelow vertical ter ' . cmd
endfunction
command! RebaseViewer call RebaseViewer()
