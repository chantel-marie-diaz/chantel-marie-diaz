set nocompatible
"filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'shmup/vim-sql-syntax'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'chrisbra/csv.vim'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'puremourning/vimspector'
Plugin 'morhetz/gruvbox'
" A few manual steps in https://github.com/iamcco/markdown-preview.nvim
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Vundle exec
call vundle#end()
filetype plugin indent on

"Enable type file detection
filetype on

"Enable plugins and load plugin for the detected file type
filetype plugin on

"Load an indent file for the detected filetype
"filetype indent on

"Add numbers
set number

"Highlight cursor line
set cursorline

"Use space characters instead of tab
"set expandtab

" Syntax highlighting
let python_highlight_all=1
syntax on


let g:gruvbox_italic=1
"let g:gruvbox_contrast_light="soft"

set background=light
colorscheme gruvbox


" Access system clipboard for mac
if has('macunix')
    set clipboard=unnamed
" Or for linux
else
    set clipboard=unnamedplus
endif


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

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p

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

function RemoveWhiteSpaces()
  exec ':%s/\s\+$//e'
endfunction
command! RemoveWhiteSpaces call RemoveWhiteSpaces()

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

function TurnOffSyntaxLongLines()
  set synmaxcol=300
endfunction
command! TurnOffSyntaxLongLines call TurnOffSyntaxLongLines()


let g:vimspector_enable_mappings = 'HUMAN'
