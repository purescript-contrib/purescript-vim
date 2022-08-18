" vim: sw=2 et

if exists("*PureScriptSetRoot") | finish | endif

setlocal comments=s1fl:{-,mb:\ \ ,ex:-},:--\ \|,:--
setlocal commentstring=--\ %s
setlocal include=^import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')).'.purs'
setlocal efm=%Eat\ %f:%l:%c\ -\ %m

fun PureScriptSetRoot()
  " search forward and backward (;) for the root of the project
  " (a dir containing any configuration file)
  let l:from_here = expand("%:p:h") . ";"
  for l:conf in ["spago.dhall"]
    let l:root = get(map(
      \ findfile(l:conf,l:from_here, -1) ,
      \ { name -> fnamemodify(name,":p:h") } ),-1,'')
    if !empty(l:root) | continue | endif
  endfor
  if empty(l:root) | return | endif
  exec 'setlocal path+='.l:root.'/src/**'
endfun

if exists('g:purescript_set_root')
  if g:purescript_set_root
    call InitPureScript()
  endif
endif
