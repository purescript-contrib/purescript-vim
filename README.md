# Purescript-vim

> purescript language support in vim and neovim 

[![Maintainer: coot](https://img.shields.io/badge/maintainer-coot-lightgrey.svg)](http://github.com/coot)

Syntax highlighting and indentation for [Purescript][] based on [idris-vim][] and [haskell-vim][].

## Installation

I recommend using [Pathogen][] for installation. Simply clone
this repo into your `~/.vim/bundle` directory and you are ready to go.

```sh
cd ~/.vim/bundle
git clone https://github.com/raichoo/purescript-vim.git
```

### Manual Installation

Copy content into your `~/.vim` directory (or `%HOME%\vimfiles` on Windows).

Be sure that the following lines are in your
`.vimrc`

```vim
syntax on
filetype on
filetype plugin indent on
```

## Configuration

### Indentation

To configure indentation in `purescript-vim` you can use the following variables:

- `let g:purescript_indent_if = 3`

```text
if bool
>>>then ...
>>>else ...
```

- `let g:purescript_indent_case = 5`

```text
case xs of
>>>>>[]     -> ...
>>>>>(y:ys) -> ...
```

- `let g:purescript_indent_let = 4`

```text
let x = 0 in
>>>>x
```

- `let g:purescript_indent_where = 6`

```text
where f :: Int -> Int
>>>>>>f x = x
```

- `let g:purescript_indent_do = 3`

```text
do x <- a
>>>y <- b
```

- `let g:purescript_indent_in = 1`

```text
let x = 0
>in x
```

- `let g:purescript_indent_dot = 1`

```text
unsnoc
  :: forall a
  >. List a
  -> Maybe (List a, a)
```

[purescript]: http://www.purescript.org

[pathogen]: https://github.com/tpope/vim-pathogen

[idris-vim]: https://github.com/idris-hackers/idris-vim

[haskell-vim]: https://github.com/raichoo/haskell-vim
