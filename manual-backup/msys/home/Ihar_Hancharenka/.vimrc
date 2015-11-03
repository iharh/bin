if has('win32') || has('win64')
    "source $VIMRUNTIME/mswin.vim
    "behave mswin
    let s:vimfilesbase='~/vimfiles/'
else
    let s:vimfilesbase='~/.vim/'
endif

set nocp

filet off "filetype

"NeoBundle stuff
"git clone git://github.com/Shougo/ne

if has('vim_starting')
   set nocp " Be iMproved
   " Required:
   let &rtp.=','.s:vimfilesbase.'bundle/neobundle.vim'
endif

call neobundle#begin(expand(s:vimfilesbase . '/bundle'))

let g:neobundle#install_process_timeout = 480

NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimproc' ", { 'build' : { 'windows' : 'mingw32-make64.bat -f make_mingw64.mak' } }
"NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'iharh/neosauce'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'derekwyatt/vim-sbt'
""NeoBundle 'docker/docker', {'rtp': 'contrib/syntax/vim'}
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'rking/ag.vim'

"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/vimshell.vim'
"NeoBundleUpdate neosauce
":NeoBundleDocs to manually regenerate tags

syn on                         " (syntax)   - turn on syntax highlighting
filet plugin indent on         " (filetype) - turn on file type detection.

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

" fix tab behaviour in normal mode
" Note the extra space after the second \
set list lcs=tab:\ \ 

" autocomplete for help works, but still have problems with file-path-names
"set wildchar=9
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection
vnoremap <BS> d

set hidden                        " Handle multiple buffers better.

set ignorecase                    " Case-insensitive searching.
"set smartcase                     " But case-sensitive if expression contains a capital letter.

"set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

"set paste                         " Do not autoindent while doing paste

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set nostartofline                 " Do not go to the start of line on scrolling like C-F/C-B/...

set title                         " Set the terminal's title

"set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
"set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l-%L,%c-%v\ %)%P

" set nowrap

" !!! vim-pandoc stuff
let g:pandoc_no_folding = 1
" au
" autocmd BufNewFile,BufRead *.txt   set filetype=pandoc

set autoindent                      " auto-indent
set path=.,,**

set hh=40                           " helpheight


"easier buffer/tabs navigation
map <C-J>  :bn<CR>
map <C-K>  :bp<CR>
map <C-L>  :tabn<CR>
map <C-H>  :tabp<CR>

" QuickFix navigation
" http://blog.sofistes.net/2013/10/effective-quickfix-window-use-in-vim.html
map <A-p> :cp<CR> 
map <A-n> :cn<CR> 
map <A-P> :colder<CR>
map <A-N> :newer<CR>


" SHIFT-Del is Cut
vnoremap <S-Del> "+x
" CTRL-Insert is Copy
vnoremap <C-Insert> "+y
" SHIFT-Insert is Paste
map <S-Insert> "+gP
"cmap <S-Insert> <C-R>+
""imap <S-Insert> <C-V>
""vmap <S-Insert> <C-V>

" works in gvim only
"map <Esc>[14^  <C-F4>
"http://mg.pov.lt/vim/vimrc
noremap <C-F4> :bw<CR>

