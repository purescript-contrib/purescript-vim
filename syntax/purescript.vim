" syntax highlighting for purescript
"
" Heavily modified version of the purescript syntax
" highlighter to support purescript.
"
" author: raichoo (raichoo@googlemail.com)

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn match purescriptModule "\<module\>"
syn match purescriptImport "\(\<foreign\>\|\<import\>\|\<hiding\>\)"
syn region purescriptQualifiedImport start="\<qualified\>" contains=purescriptType,purescriptDot end="\<as\>"
syn match purescriptStructure "\<\(data\|type\|class\|instance\|where\)\>"
syn match purescriptStatement "\<\(forall\|do\|case\|of\|let\|in\)\>"
syn match purescriptConditional "\<\(if\|then\|else\)\>"
syn match purescriptNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match purescriptFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match purescriptDelimiter  "(\|)\|\[\|\]\|,\|;\|_\|{\|}"
syn match purescriptInfix "\<\(infix\|infixl\|infixr\)\>"
syn match purescriptOperators "\([-!#$%&\*\+/<=>\?@\\^|~:]\|\<_\>\)"
syn match purescriptDot "\."
syn match purescriptType "\<\([A-Z][a-zA-Z0-9_]*\|_|_\)\>"
syn match purescriptLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
syn match purescriptChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"
syn match purescriptBacktick "`[A-Za-z][A-Za-z0-9_]*`"
syn region purescriptString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region purescriptBlockComment start="{-" end="-}" contains=purescriptBlockComment

highlight def link purescriptImport Structure
highlight def link purescriptQualifiedImport Structure
highlight def link purescriptModule Structure
highlight def link purescriptStructure Structure
highlight def link purescriptStatement Statement
highlight def link purescriptConditional Conditional
highlight def link purescriptNumber Number
highlight def link purescriptFloat Float
highlight def link purescriptDelimiter Delimiter
highlight def link purescriptInfix PreProc
highlight def link purescriptOperators Operator
highlight def link purescriptDot Operator
highlight def link purescriptType Include
highlight def link purescriptLineComment Comment
highlight def link purescriptBlockComment Comment
highlight def link purescriptString String
highlight def link purescriptChar String
highlight def link purescriptBacktick Operator

let b:current_syntax = "purescript"
