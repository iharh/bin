" Add vim commands, mappings, functions, etc for this source
"
let g:current_dir = "D:\\clb\\src\\main\\fx\\fx"
"exec 'cd ' . g:current_dir

" TODO: share this stuff
compiler ant
set makeprg=antcq\ -find\ build.xml
"errorformat
set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

