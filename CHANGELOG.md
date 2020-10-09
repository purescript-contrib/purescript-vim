# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes (😱!!!):
  - use "-- %s" instead of "{--%s--}" for comemnts [p68][]
  - rename all indentation settings to be prefixed by `g:` [p73][]

New features:
  - add vim manual (`:help purescript-vim`) [p73][]

Bugfixes:

Other improvements:
  - rename default branch to 'main', clarify readme, add changelog [p73][]

## [v1.0.0](https://github.com/purescript-contrib/purescript-vim/releases/tag/v1.0.0) - 2017-10-19

Syntax issues (#35)

* syntax

* add purescriptClassDecl region
  - import class
  - class statement
  - higlight class keyword and class name
* higlight instances

Issues: #22, #23

* remove commented code

* Indent (#44)

* indent class and remove '|' from operator characters

If '|' was included then there is extra indent in
```
class RowLacking (entry :: Type)
                 (key :: Symbol)
                 (typ :: Type)
                 (row :: # Type) |
		 >>
                 entry typ -> key row
```

* indent pattern guards

* guard against class
* if the previous line contains `| otherwise` find the first line that
  does not start with `|` (actually find the first line that starts with
  `\k`, '^\%(\s*|\)\@!' did not work inside indent function for some
  reason.

* Fixed #48

* Fixed #49

[p68][https://github.com/purescript-contrib/purescript-vim/pull/70]
[p73][https://github.com/purescript-contrib/purescript-vim/pull/73]
