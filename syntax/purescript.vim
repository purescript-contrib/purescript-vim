" syntax highlighting for purescript
"
" Heavily modified version of the purescript syntax
" highlighter to support purescript.
"
" author: raichoo (raichoo@googlemail.com)

if exists("b:current_syntax")
  finish
endif

syn match purescriptType "\<[A-Z]\w*\>"
  \ nextgroup=purescriptType,purescriptTypeVar,purescriptOperatorTypeSig,purescriptDelimiter,purescriptBlockDelimiter skipwhite
syn match purescriptTypeVar "\<[_a-z]\(\w\|\'\)*\>" contained
syn region purescriptTypeExport matchgroup=purescriptType start="\<[A-Z]\(\S\&[^,.]\)*\>("rs=e-1 matchgroup=purescriptBlockDelimiter end=")" contained extend
  \ contains=purescriptConstructor,purescriptBlockDelimiter

syn match purescriptConstructor "\<[A-Z]\w*\>" contained
  \ nextgroup=purescriptIdentifier skipwhite
syn region purescriptConstructorDecl matchgroup=purescriptConstructor start="\<[A-Z]\w*\>" end="\(|\|$\)"me=e-1,re=e-1
  \ contains=purescriptType,purescriptTypeVar,purescriptDelimiter,purescriptBlockDelimiter,purescriptOperatorType,purescriptOperatorTypeSig

syn match purescriptIdentifier "\<[_a-z]\(\w\|\'\)*\>" contained
  \ nextgroup=purescriptIdentifier skipwhite
syn region purescriptFunctionBody excludenl start="^\z(\s*\)[_a-z]\(\w\|\'\)*\([^=]\{-}=\|\_.\{-}|\)" end="^\z1\?\S"me=s-1,re=s-1 fold keepend
  \ contains=purescriptNumber,purescriptFloat,purescriptConstructor,purescriptOperator,purescriptOperatorFunction,purescriptDelimiter,purescriptBlockDelimiter,purescriptConditional,purescriptStatement,purescriptWhere,purescriptChar,purescriptBacktick,purescriptString,purescriptMultilineString,purescriptLineComment,purescriptBlockComment,purescriptFunctionDecl,purescriptFunctionBody
syn region purescriptFunctionDecl start="^\z(\s*\)\(foreign import\s\+\)\?[_a-z]\(\w\|\'\)*\s*\(::\|∷\)" end="^\z1\?\S"me=s-1,re=s-1 keepend
  \ contains=purescriptFunctionDeclStart,purescriptOperatorType,purescriptOperatorTypeSig,purescriptType,purescriptTypeVar,purescriptBlockDelimiter,purescriptDelimiter,purescriptForall
syn match purescriptFunctionDeclStart "\(foreign import\s\+\)\?[_a-z]\(\w\|\'\)*\s*\(::\|∷\)" contained
  \ contains=purescriptImportKeyword,purescriptFunctionName,purescriptOperatorType
syn match purescriptFunctionName "\<[_a-z]\(\w\|\'\)*\>" contained
syn match purescriptFunctionName "(\(\W\&[^(),\"]\)\+)" contained extend
syn match purescriptForall "\(forall\|∀\)"
  \ nextgroup=purescriptTypeVar skipwhite

syn match purescriptModule "^\<module\>\s\+\<\(\w\+\.\?\)*\>"
  \ contains=purescriptModuleKeyword,purescriptModuleName
  \ nextgroup=purescriptModuleParams skipwhite skipempty
syn keyword purescriptModuleKeyword module contained
syn match purescriptModuleName "\(\w\+\.\?\)*" contained excludenl
syn region purescriptModuleParams start="(" end=")" fold contained keepend
  \ contains=purescriptBlockComment,purescriptLineComment,purescriptDelimiter,purescriptType,purescriptTypeExport,purescriptFunctionName
  \ nextgroup=purescriptImportParams skipwhite

syn match purescriptImport "\<import\>\s\+\(qualified\s\+\)\?\(\<\(\w\|\.\)*\>\)"
  \ contains=purescriptImportKeyword,purescriptModuleName
  \ nextgroup=purescriptModuleParams,purescriptImportParams skipwhite
syn match purescriptImportParams "as\s\+\(\w\+\)" contained
  \ contains=purescriptModuleName,purescriptAsKeyword
  \ nextgroup=purescriptModuleParams,purescriptImportParams skipwhite
syn match purescriptImportParams "hiding" contained
  \ contains=purescriptHidingKeyword
  \ nextgroup=purescriptModuleParams,purescriptImportParams skipwhite

syn keyword purescriptImportKeyword foreign import qualified contained
syn keyword purescriptAsKeyword as contained
syn keyword purescriptHidingKeyword hiding contained

syn keyword purescriptConditional if then else
syn keyword purescriptStatement do case of let in
syn keyword purescriptWhere where
syn keyword purescriptStructure foreign data newtype type class instance derive contained
syn keyword purescriptInfix infix infixl infixr

syn match purescriptNumber "[0-9]\+\|0[xX][0-9a-fA-F]\+\|0[oO][0-7]"
syn match purescriptFloat "[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\="

syn match purescriptOperator "\([-!#$%&\*\+/<=>\?@\\^|~:]\|\<_\>\)"
syn match purescriptOperatorType "\(::\|∷\)" contained
  \ nextgroup=purescriptForall,purescriptType skipwhite skipempty
syn match purescriptOperatorTypeSig "\(->\|<-\|=>\|<=\|::\|[∷∀→←⇒⇐]\)" contained
  \ nextgroup=purescriptType skipwhite skipempty
syn match purescriptOperatorFunction "\(->\|<-\|[→←]\)" contained

syn match purescriptDelimiter "[,;|]"
syn match purescriptBlockDelimiter "[()[\]{}]"

syn region purescriptDataType start="^data" end="="me=e-1,re=e-1
  \ nextgroup=purescriptDataConstructors skipwhite skipnl
  \ contains=purescriptStructure,purescriptType,purescriptTypeVar
syn region purescriptDataConstructors start="" end="^\S"me=e-1 contained keepend
  \ contains=purescriptForall,purescriptConstructorDecl,purescriptTypeVar,purescriptDelimiter,purescriptBlockDelimiter,purescriptOperator,purescriptOperatorType,purescriptOperatorTypeSig
syn region purescriptForeignData start="^foreign\s\+import\s\+data\>" end="$"
  \ contains=purescriptImportKeyword,purescriptStructure,purescriptType,purescriptOperatorType,purescriptOperator,purescriptOperatorTypeSig
syn region purescriptNewtype start="^newtype" end="="he=e-1
  \ contains=purescriptStructure,purescriptType,purescriptTypeVar
  \ nextgroup=purescriptForall,purescriptConstructorDecl,purescriptTypeVar skipwhite skipnl
syn region purescriptTypeAlias start="^type" end="="he=e-1
  \ contains=purescriptStructure,purescriptType,purescriptTypeVar
  \ nextgroup=purescriptForall,purescriptType,purescriptTypeVar skipwhite skipnl

syn region purescriptClass start="^\<class\>" end="where"me=e-5
  \ contains=purescriptStructure,purescriptType,purescriptTypeVar
  \ nextgroup=purescriptWhere
syn region purescriptInstance start="^instance\>" end="where"me=e-5
  \ contains=purescriptStructure,purescriptIdentifier,purescriptOperatorType,purescriptType,purescriptTypeVar
  \ nextgroup=purescriptWhere
syn region purescriptInstance start="^instance\>" end="$"
  \ contains=purescriptStructure,purescriptIdentifier,purescriptOperatorType,purescriptType,purescriptTypeVar
  \ nextgroup=purescriptWhere
syn region purescriptDeriveInstance start="^derive\s\+instance\>" end="$"
  \ contains=purescriptStructure,purescriptInstanceKeyword,purescriptIdentifier,purescriptOperatorType,purescriptType,purescriptTypeVar
  \ nextgroup=purescriptWhere

syn match purescriptChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"
syn match purescriptBacktick "`[A-Za-z][A-Za-z0-9_]*`"

syn region purescriptString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region purescriptMultilineString start=+"""+ end=+"""+ fold

syn match purescriptLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
syn region purescriptBlockComment start="{-" end="-}" fold
  \ contains=purescriptBlockComment

highlight def link purescriptModuleKeyword purescriptKeyword
highlight def link purescriptModuleName Include
highlight def link purescriptModuleParams purescriptDelimiter
highlight def link purescriptImportKeyword purescriptKeyword
highlight def link purescriptAsKeyword purescriptKeyword
highlight def link purescriptHidingKeyword purescriptKeyword

highlight def link purescriptConditional Conditional
highlight def link purescriptWhere purescriptKeyword
highlight def link purescriptInfix PreProc
highlight def link purescriptNumber Number
highlight def link purescriptFloat Float

highlight def link purescriptBlockDelimiter purescriptDelimiter
highlight def link purescriptDelimiter Delimiter

highlight def link purescriptOperatorType purescriptOperator
highlight def link purescriptOperatorTypeSig purescriptOperatorType
highlight def link purescriptOperatorFunction purescriptOperatorType

highlight def link purescriptFunctionName purescriptFunction

highlight def link purescriptConstructor purescriptFunction
highlight def link purescriptConstructorDecl purescriptConstructor

highlight def link purescriptTypeVar purescriptIdentifier
highlight def link purescriptForall purescriptStatement

highlight def link purescriptChar String
highlight def link purescriptBacktick purescriptOperator
highlight def link purescriptString String
highlight def link purescriptMultilineString String

highlight def link purescriptLineComment purescriptComment
highlight def link purescriptBlockComment purescriptComment

highlight def link purescriptStructure purescriptKeyword
highlight def link purescriptKeyword Keyword
highlight def link purescriptStatement Statement
highlight def link purescriptOperator Operator
highlight def link purescriptIdentifier Identifier
highlight def link purescriptFunction Function
highlight def link purescriptType Type
highlight def link purescriptComment Comment

let b:current_syntax = "purescript"
