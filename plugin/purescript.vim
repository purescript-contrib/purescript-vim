""
" @section Introduction, intro
" purescript-vim provides purescript language support in vim and neovim.

if !exists('g:purescript_indent_if')

  ""
  " Control indent width of key word `if`. default is 3.
  " >
  "     if bool
  "     >>>then ...
  "     >>>else ...
  " <
  let g:purescript_indent_if = 3
endif

if !exists('g:purescript_indent_case')
  ""
  " Control indent width of key word `case`. default is 5.
  " >
  "     case xs of
  "     >>>>>[]     -> ...
  "     >>>>>(y:ys) -> ...
  " <
  let g:purescript_indent_case = 5
endif

if !exists('g:purescript_indent_let')
  ""
  " Control indent width of key word `let`. default is 4.
  " >
  "     let x = 0 in
  "     >>>>x
  " <
  let g:purescript_indent_let = 4
endif

if !exists('g:purescript_indent_in')
  ""
  " Control indent width of key word `in`. default is 1.
  " >
  "     let x = 0
  "     >in
  " <
  let g:purescript_indent_in = 1
endif

if !exists('g:purescript_indent_where')
  ""
  " Control indent width of key word `where`. default is 6.
  " >
  "     where
  "     >>>>>>f :: Int -> Int
  "     >>>>>>f x = x
  " <
  let g:purescript_indent_where = 6
endif

if !exists('g:purescript_indent_do')
  ""
  " Control indent width of key word `do`. default is 3.
  " >
  "     do x <- a
  "     >>>y <- b
  " <
  let g:purescript_indent_do = 3
endif

if !exists('g:purescript_indent_dot')
  ""
  " Control indent width of dot. default is 1.
  " >
  "     f
  "       :: forall a
  "       >. String
  "       -> String
  " <
  let g:purescript_indent_dot = 1
endif


