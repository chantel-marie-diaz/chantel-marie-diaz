set nocompatible
"filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'itchyny/lightline.vim'
Plugin 'shmup/vim-sql-syntax'
Plugin 'chrisbra/csv.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'puremourning/vimspector'
Plugin 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }
Plugin 'itchyny/vim-gitbranch'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'gryf/pylint-vim'
Plugin 'arcticicestudio/nord-vim'
" A few manual steps in https://github.com/iamcco/markdown-preview.nvim
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" Vundle exec
call vundle#end()
filetype plugin indent on


" Lightline
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


let g:vimspectorpy#launcher = "xterm"

"Enable type file detection
filetype on

"Enable plugins and load plugin for the detected file type
filetype plugin on

"Load an indent file for the detected filetype
filetype indent on

"Add numbers
set number

"Highlight cursor line
set cursorline

"Use space characters instead of tab
"set expandtab

"While searching through a file incrementally highlight matching characters as you "type.
set incsearch

"Ignore capital letters during search.
set ignorecase

"Override to look for capital letters
set smartcase

"Show partial command you type in the line
set showcmd

"Show the mode you are on the last line
set showmode

"Show matching words during a search.
set showmatch

"Use highlightig when doing a search.
set hlsearch

"Enable autocompletion
set wildmenu

"List long
set wildmode=list:longest

"ignore
"set wildignore=*.docx, *.jpg, *.png, *.gif, *pdf, *.pyc, *exe, *.flv

"Set no wrap
set nowrap

" Set tabs as 2 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Access system clipboard for mac
if has('macunix')
    set clipboard=unnamed
" Or for linux
else
    set clipboard=unnamedplus
endif

" Syntax highlighting
let python_highlight_all=1
syntax on

" Nord
colorscheme nord
highlight Comment ctermfg=LightGrey

"Ale Linting
" Note add yamllint to ale
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_hover_to_preview = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'autoflake','isort'],
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

highlight ALEWarning ctermbg=DarkMagenta ctermfg=DarkYellow  cterm=underline
highlight ALEError ctermbg=DarkMagenta ctermfg=DarkYellow  cterm=underline
highlight ALEErrorLine ctermbg=DarkMagenta ctermfg=DarkYellow
highlight ALEErrorSign ctermbg=DarkMagenta ctermfg=DarkYellow

" Vimspector for Debugging
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" You Complete Me
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc>P

" NERDTree Mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTree and Interface Font, also set in Terminator
set guifont=Hasklug\ Nerd\ Font\ Mono\ Medium\ 11
set gfw=Hasklug\ Nerd\ Font\ Mono\ Medium\ 11
set encoding=UTF-8

" NERDTree Syntax
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" NERDTree with Git Plugin
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

" NERDTree Use NERD Fonts and Untracked
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal

" Keep the most recently pasted item in clipboard
xnoremap p pgvy

" Autostart git gutter
autocmd VimEnter * GitGutter

" Autoformat csv on open
" Borrowed from: https://github.com/chrisbra/csv.vim/blob/master/csv.vmb
aug CSV_Editing
    au!
    au BufRead,BufWritePost *.csv :%ArrangeColumn
    au BufWritePre *.csv :%UnArrangeColumn
aug end

" Allow mouse
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

" Highlight trailing whitespace
function HighlightTrailingWhitespace()
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
endfunction
autocmd VimEnter,BufWritePost * call HighlightTrailingWhitespace()

" Show flake8 gutter
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Patch xterm printing weird chars on line 1
set t_TI= t_TE=

function WritePyBreakpoint()
  let line=line('.')
  let indent=indent(line)
  let pad = repeat(' ', indent)
  call append(line - 1, pad . 'breakpoint()')
endfunction
command! WritePyBreakpoint call WritePyBreakpoint()
nmap <C-b><C-k> :WritePyBreakpoint<CR>

function RemovePyBreakpoints()
  exec ':g/breakpoint()/d'
endfunction
command! RemovePyBreakpoints call RemovePyBreakpoints()

function GenerateGithubLink()
  " Get the current branch name and string the new line chars
  let branch = substitute(system('git branch --show-current'), '\n\+$', '', '')
  " Get the current repo url, parse it
  let url = system('git config --get remote.origin.url')
  let raw_repo_root = split(url, ":")[1]
  let repo_root = split(raw_repo_root, ".git")[0]
  let file_name = @%
  let line_nbr = line(".")
  " Print full github url
  echo 'https://github.com/' . repo_root . '/blob/' . branch . '/' . file_name . '#L' . line_nbr
endfunction
command! GenerateGithubLink call GenerateGithubLink()

" Git show the hash under the cursor
" when doing an interactive rebase
function RebaseViewer()
  let hash = expand("<cword>")
  let cmd = 'git show ' . hash
  echo cmd
  exec ':rightbelow vertical ter ' . cmd
endfunction
command! RebaseViewer call RebaseViewer()
