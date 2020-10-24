# purescript-vim
[![Maintainer: vladciobanu](https://img.shields.io/badge/maintainer-vladciobanu-lightgrey.svg)](http://github.com/vladciobanu)

[Purescript][] language support for vim and neovim providing syntax highlighting and indentation based on based on [idris-vim][] and [haskell-vim][].

See [purescript-language-server][] for details on how to set up language server support for [Purescript][].

## Installation

### Manual Installation (no plugin manager)

Copy content of this repository into your `~/.vim` directory (or `%HOME%\vimfiles` on Windows).

Be sure that the following lines are in your `.vimrc`
```vim
syntax on
filetype on
filetype plugin indent on
```

### Pathogen

If you are using [Pathogen][], clone this repo into your `~/.vim/bundle` directory and you are ready to go.

```sh
cd ~/.vim/bundle
git clone https://github.com/purescript-contrib/purescript-vim.git
```
### vim-plug

If you are using [vim-plug][], add the following line in between your `plug#begin` and `plug#end` calls for your vim config file:

```vim
Plug 'purescript-contrib/purescript-vim'
```

Save and restart (neo)vim and run `:PlugInstall`.

## Configuration

### Indentation

To configure indentation in `purescript-vim` you can use the following variables:

#### g:purescript_disable_indent

Disable indentation altogether.

```vim
let g:purescript_disable_indent = 1
```

#### g:purescript_indent_case

```vim
let g:purescript_indent_case = 5
```

```purescript
        case xs of
        >>>>>[]     -> ...
        >>>>>(y:ys) -> ...
```

#### g:purescript_indent_let

```vim
let g:purescript_indent_let = 4
```

```purescript
        let x = 0 in
        >>>>x
```

#### g:purescript_indent_in

```vim
let g:purescript_indent_in = 1
```

```purescript
	let x = 0
	>in x
```

#### g:purescript_indent_where

```vim
let g:purescript_indent_where = 6
```

```purescript
        where f :: Int -> Int
        >>>>>>f x = x
```

#### g:purescript_indent_do

```vim
let g:purescript_indent_do = 3
```

```purescript
        do x <- a
        >>>y <- b
```

#### g:purescript_indent_dot

```vim
let g:purescript_indent_dot = 1
```

```purescript
	unsnoc
	  :: forall a
	  >. List a
	  -> Maybe (List a, a)
```

## Contributing

Contributing checklist:

- [ ] Opened an issue before investing a significant amount of work into changes
- [ ] Update README.md with any new configuration options and behavior
- [ ] Update CHANGELOG.md with the proposed changes
- [ ] Run `generate-doc.sh` to re-generate the documentation


[Purescript]: http://www.purescript.org
[Pathogen]: https://github.com/tpope/vim-pathogen
[idris-vim]: https://github.com/idris-hackers/idris-vim
[haskell-vim]: https://github.com/raichoo/haskell-vim
[vim-plug]: https://github.com/junegunn/vim-plug
[purescript-language-server]: https://github.com/nwolverson/purescript-language-server#vimcoc
