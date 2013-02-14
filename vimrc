filetype on
set ignorecase
set incsearch
set nowrap
set textwidth=0
set tabstop=4
set shiftwidth=4
set winminheight=0
set expandtab
set background=dark
set laststatus=2
set scroll=3 " for Control-d and Control-u
set scrolloff=3 " for Control-d and Control-u
set ruler " to see the column numbers
set autoindent
set smartindent
map <F12> :cn
map <F11> :cp
map  2j
map  2k

" Minimal changes from the defaults; including fg colors in case of syntax highlighting:
:highlight DiffAdd    ctermfg=black ctermbg=green
:highlight DiffDelete ctermfg=black ctermbg=magenta
:highlight DiffChange ctermfg=black ctermbg=gray
:highlight DiffText   ctermfg=black ctermbg=Yellow

au BufWritePost *.php,*.phtml,*.js silent! !~/bin/sync.sh 2>&1 > /dev/null &

" Align plugin
" http://vim.sourceforge.net/scripts/script.php?script_id=294
set nocompatible
filetype plugin on

syntax on

" setting for mouse to work
" use r to allow copy/paste.
" to copy text out of vim use SHIFT with mouse.
" See: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
set ttymouse=xterm2
set mouse=a 

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

function! MyVerbose()
    set spelllang=en_us
    set spell!
    " Highlight tabs.http://www.paulgraydon.co.uk/geeky/nixtricks/vim-highlight-tabs/
    set lcs=tab:>-,trail:%,eol:$
    set list!
    set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
endfunction

" See http://vim.wikia.com/wiki/Write_your_own_Vim_function
function! Cd()
    exe "!cdargs"
    let mydir = system("cat /home/raleigh/jrajpu10/.cdargsresult")
    " See http://stackoverflow.com/questions/4596932/vim-cd-to-path-stored-in-variable
    "cd `=mydir`
    edit `=mydir`
endfunction
" Alias to my function so you do not need to type call everytime.
command Cd call Cd()

" See http://vim.wikia.com/wiki/Managing_set_options
nnoremap <F9>:call ToggleMouse()<CR>

function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

" CommandT related setting.
nnoremap <silent> t :CommandT<CR>
nnoremap <silent> b :CommandTBuffer<CR>
let g:CommandTCancelMap='<C-x>'

" Make backspace work in insert mode
" see
" http://vim.wikia.com/wiki/Erasing_previously_entered_characters_in_insert_mode
" setting backspace also make C-w and Control-u works for deleting words.
set backspace=indent,eol,start
set backspace=2

" Make it the last as I have realized that sometimes it does not work.
set expandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" OLD DEAD CODE - KEPT HERE FOR REFERENCE PURPOSES.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping for moving between buffers.
" map [C :bnext
" map [D :bprev
"map ^B :buffers^M
" Function to read file name
"function! ReadFileName()
"    let l:linenum  = search("^// *[Mm]odule","w")
"    let l:filename = getreg("%")
"    let l:newline  = '// Module :  '.filename
"    sil exe ":call setline( linenum, newline)"
"endfunction
" Syntax check and error formating
"function! PHPsynCHK()
"    let winnum =winnr() " get current window number
"    silent make -l %
"    " open the error window if it contains error
"    " return to the window with cursor set on the line of the first error (if
"    " any)
"    cw
"    execute winnum . "wincmd w"
"endfunction
"set makeprg=php\ -l\ %
"set errorformat=%m\ in\ %f\ on\ line\ %l
"" abbreviation
"ab mres mysql_real_escape_string
"ab mfr  mysql_fetch_row
"ab mr   mysql_result
"ab mnr  mysql_num_rows
"iab aps APS_LOG( TRACE_LOG, "", __FILE__, __LINE__ );
""ab PR   // PR122132.
"function! PreviewWord()
"  if &previewwindow " don't do this in the preview window
"    return
"  endif
"  let w = expand("<cword>") " get the word under cursor
"  sil exe ":echo \"". w ."\""
"endfunction
"" abbrevation for doing commenting at end of functin curly bracket end "}"
"" }// to comment the code
"iab }// :call CurlyBracket()
"
"function CurlyBracket()
"    let l:my_linenum = line(".")
"    let l:linenum    = searchpair('{', '', '}', 'bW')
"    let l:line       = getline(l:linenum - 1)
"    let l:str        = strpart( line, 4 )
"    sil exe ":" . l:my_linenum
"    sil exe "normal a} // end of " . str
"endfunction
"
""function CommentUncomment()
""{
""    let l:myLineNum = line(".")
""    let l:line      = getline(l:myLineNum)
""    if matchstr(l:line, "^\s*//")
""        sil exe "normal dd"
""        sil exe "normal ik"
""    elseif
""
""    end if
""
""}
":map <F11> :!grep -n "^.\{81,\}$" %
"set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
"set complete-=k complete+=k
""if &background == "dark"
""    hi Comment term=bold ctermfg=DarkCyan guifg=#80a0ff
""else
""    hi Comment  term=bold ctermfg=DarkBlue guifg=Blue
""endif
""set path+=.,./include,./include/classes
"" Folding copied from google.
""set foldmethod=indent
""set foldlevel=0
""set foldnestmax=2
""set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-
""
""map ^[f :let &fen = !&fen<CR>
""map e :e 
""let g:miniBufExplVSplit = 25
"" Copied from tclark2
"" Colors for vimdiff
""
"" Valid character terminal BG colors:
""   ctermbg=black
""   ctermbg=brown
""   ctermbg=cyan
""   ctermbg=darkblue
""   ctermbg=darkgreen
""   ctermbg=fg
""   ctermbg=gray
""   ctermbg=lightblue
""   ctermbg=magenta
""   ctermbg=red
""
"" Full color specs:
"":highlight DiffAdd    cterm=none ctermfg=black ctermbg=green   gui=none guifg=black guibg=Green
"":highlight DiffDelete cterm=none ctermfg=black ctermbg=magenta gui=none guifg=black guibg=Red
"":highlight DiffChange cterm=none ctermfg=black ctermbg=gray    gui=none guifg=black guibg=Yellow
"":highlight DiffText   cterm=none ctermfg=black ctermbg=Yellow  gui=none guifg=black guibg=Magenta
""
""let g:miniBufExplVSplit = 25
""map <unique> <Leader>t <Plug>TMiniBufExplorer
"set scroll=6
"function GetFunArg(myArg)
"    let var1 = "echo " . a:myArg
"    echo var1
"    " let @b = system(var1)
"endfunction
"let s:javaname = '[a-zA-Z_][a-zA-Z0-9_]*'
"
"function! JCommentWriter() range
"    let s:rangeStart = a:firstline
"    let s:rangeEnd   = a:lastline
"    let s:combinedString = s:GetCombinedString(s:rangeStart, s:rangeEnd)
"    " echo s:combinedString
"    call s:ResolveMethodParams(s:combinedString) 
"    let param = s:GetNextParameterName()
"    let params = param
"    let s:indent = s:method_indent
"    let s:linesAppended = 0
"    while param != ''
"        let params = params . param
"        let params = params . ' '
"        call s:AppendStr(param)
"        let param = s:GetNextParameterName()
"    endwhile
"    echo params
"    "echo param
"endfunction
"
"function! s:GetCombinedString(rangeStart, rangeEnd)
"  let line       = a:rangeStart
"  let combinedString = getline(line)
"
"  while line < a:rangeEnd
"    let line = line + 1
"    let combinedString = combinedString . ' ' . getline(line)
"  endwhile
"
"  return substitute(combinedString, '^\([^;{]*[;{]\=\).*', '\1', '')
"endfunction
"
"function! s:ResolveMethodParams(methodHeader)
"  let methodHeader = a:methodHeader
"  let methodHeader = substitute(methodHeader, '^\(.\{-}\)\s*[{;].*', '\1', '')
"  let s:appendPos = s:rangeStart - 1
"  let s:method_indent = substitute(methodHeader, '^\(\s*\)\S.*', '\1', '')
"
"  let s:method_paramList = substitute(methodHeader, '.*(\(.*\)).*', '\1', '')
"  let s:method_paramList = s:Trim(s:method_paramList)
"  echo s:method_paramList
"endfunction
"
"function! s:Trim(string)
"  return substitute(a:string, '^\s*\(.\{-}\)\s*$', '\1', '')
"endfunction
"
"function! s:GetNextParameterName()
"  let result = substitute(s:method_paramList, '.\{-}\s\+\(' . s:javaname .  '\)\s*\(,.*\|$\)', '\1', '')
"  if s:method_paramList !~ ','
"    let s:method_paramList = ''
"  else
"     let endIndex = matchend(s:method_paramList, ',\s*')
"     let s:method_paramList = strpart(s:method_paramList, endIndex)
"  endif
"  return result
"endfunction!
"
"let s:appendPos = 1
"function! s:AppendStr(string)
"  call append(s:appendPos, s:indent . a:string)
"  let s:appendPos = s:appendPos + 1
"  let s:linesAppended = s:linesAppended + 1
"endfunction
"" My wiki - http://ifacethoughts.net/2008/05/02/vim-as-a-personal-wiki/
"set tags=/home/raleigh/jrajpu10/wiki
"autocmd BufWritePost /home/raleigh/jrajpu10/wiki/* :helptags /home/raleigh/jrajpu10/wiki
"au BufNewFile,BufRead /home/raleigh/jrajpu10/wiki/* set filetype=help
"" vtree explorer setting
"let g:treeExplVertical = 1
"" http://vim.wikia.com/wiki/Project_browsing_using_find
"" set path=$PWD/**
" Dir Diff setting
"let g:DirDiffExcludes = "*contrib*,*.C,*.h,*.so"
" NERD Tree explorer
" http://bpdp.blogspot.com/2012/01/arrows-problem-in-nerdtree-vim-plugin.html
"let g:NERDTreeDirArrows  = 0
"set nohlsearch
"set nocindent
"set noautoindent
" This is for snipmate
"filetype plugin on
"set runtimepath+=~/.vim/l9
"map + 5+
"map - 5-
"set runtimepath+=~/.vim/fuzzyfinder
