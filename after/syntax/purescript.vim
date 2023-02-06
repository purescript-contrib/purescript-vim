scriptencoding utf-8
" Great for those that want Unicode, but their project’s config or style guide
" does not endorse the usage. Much of the code is based on VimL code for
" concealing Haskell, Idris, and OCaml.

if !get(g:, 'purescript_unicode_conceal_enable', 0) || !has('conceal') || &encoding !=? 'utf-8'
	finish
endif

" vim: set fenc=utf-8:
syntax match purescriptNiceOperator '->' conceal cchar=→
	\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
syntax match purescriptNiceOperator '<-' conceal cchar=←
	\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
syntax match purescriptNiceOperator '=>' conceal cchar=⇒
	\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
syntax match purescriptNiceOperator "<=\ze[^<]" conceal cchar=⇐
	\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
syntax match purescriptNiceOperator '::' conceal cchar=∷
	\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
syntax keyword purescriptNiceOperator forall conceal cchar=∀
	\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType

if !get(g:, 'purescript_unicode_conceal_disable_common', 1)
	syntax match purescriptNiceOperator "\/\@<!\\\ze[[:alpha:][:space:]_([]" conceal cchar=λ
	syntax match purescriptNiceOperator "\~>" conceal cchar=↝
		\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
	syntax match purescriptNiceOperator '<<<' conceal cchar=∘
	syntax match purescriptNiceOperator '==' conceal cchar=≡
	syntax match purescriptNiceOperator '/=' conceal cchar=≠
	" deals with Kliesli operator false positives
	syntax match purescriptNiceOperator "<=\ze[^<]" conceal cchar=≤
	syntax match purescriptNiceOperator ">=\ze[^>]" conceal cchar=≥
endif

" These have a general meaning in mathematics; nothing in this block should be
" for ‘fun’ or ‘cute’. Perhaps that’s more suited for a new block or extension…
if get(g:, 'purescript_unicode_conceal_enable_discretionary', 0)
	syntax keyword purescriptNiceOperator exists conceal cchar=∃
		\ containedin=purescriptTypeExport,purescriptConstructorDecl,purescriptClassDecl,purescriptFunctionDecl,purescriptData,purescriptNewtype,purescriptTypeAlias,purescriptOperatorType
	syntax match purescriptNiceOperator '\<sum\>' conceal cchar=∑
	syntax match purescriptNiceOperator '\<product\>' conceal cchar=∏
	syntax match purescriptNiceOperator '\<sqrt\>' conceal cchar=√
	syntax match purescriptNiceOperator '\<not\>' conceal cchar=¬
	syntax match purescriptNiceOperator "||\ze[[:alpha:][:space:]_([]" conceal cchar=∨
	syntax match purescriptNiceOperator "&&\ze[[:alpha:][:space:]_([]" conceal cchar=∧
	syntax match purescriptNiceOperator '`elem`' conceal cchar=∈
	syntax match purescriptNiceOperator '`notElem`' conceal cchar=∉
	syntax match purescriptNiceOperator '`union`' conceal cchar=∪
	syntax match purescriptNiceOperator '`intersect`' conceal cchar=∩
	syntax match purescriptNiceOperator '\<infinity\>' conceal cchar=∞
	syntax match purescriptNiceIdentifier '\<pi\>' conceal cchar=π
	syntax match purescriptNiceIdentifier '\<tau\>' conceal cchar=τ
	syntax match purescriptNiceIdentifier '\<empty\>' conceal cchar=∅
	syntax match purescriptNiceIdentifier '\<zero\>' conceal cchar=∅
	syntax match purescriptNiceType '\<Boolean\>' conceal cchar=𝔹
		\ containedin=purescriptType
	syntax match purescriptNiceType '\<Int\>'  conceal cchar=ℤ
		\ containedin=purescriptType
	syntax match purescriptNiceType '\<Natural\>'  conceal cchar=ℕ
		\ containedin=purescriptType
	syntax match purescriptNiceType '\<Void\>'  conceal cchar=⊥
		\ containedin=purescriptType
	" TODO: conceal primes with ′, ″, ‴, ⁗
endif

highlight link purescriptNiceIdentifier Identifier
highlight! link Conceal Identifier
highlight link purescriptNiceType Type
highlight! link Conceal Type
highlight link  purescriptNiceOperator Operator
highlight! link Conceal Operator

setlocal conceallevel=2
