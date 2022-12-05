# purescript-vim

[![Maintainer: toastal](https://img.shields.io/badge/maintainer-toastal-teal.svg)](https://github.com/toastal)

[PureScript][] language support for Vim and Neovim providing syntax highlighting and indentation based on based on [idris-vim][] and [haskell-vim][].

See [purescript-language-server][] for details on how to set up language server support for [PureScript][].

## License

This project is licensed under The 2-Clause BSD License ([BSD-2-Clause](https://opensource.org/licenses/BSD-2-Clause)) — see the LICENSE file in this project for details.

## Installation

### Manual Installation (no plugin manager)

Copy content of this repository into your `~/.vim` directory (or `%HOME%\vimfiles` on Windows).

Be sure that the following lines are in your `.vimrc`
```vim
syntax on
filetype on
filetype plugin indent on
```

### Vim 8 packages

If you have Vim version 8 (`vim --version | head -n1`), you can install plugins with the native pack system:

```sh-session
$ mkdir -p ~/.vim/pack/plugins/start/
$ cd ~/.vim/pack/plugins/start/
$ git clone https://github.com/purescript-contrib/purescript-vim.git
```

### Pathogen

If you are using [Pathogen][], clone this repo into your `~/.vim/bundle` directory and you are ready to go.

```sh-session
$ cd ~/.vim/bundle
$ git clone https://github.com/purescript-contrib/purescript-vim.git
```
### vim-plug

If you are using [vim-plug][], add the following line in between your `plug#begin` and `plug#end` calls for your Vim config file:

```vim
Plug 'purescript-contrib/purescript-vim'
```

Save and restart (Neo)Vim and run `:PlugInstall`.

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

## Unicode conceal

If you wish to have some symbols concealed for their Unicode equivalents, you may use these options. Each setting will conceal the following ASCII code block for an example output.

```purescript
sum :: forall a f. Foldable f => Semiring a => f a -> a
sum = foldl (\a b -> a + b) zero

sumMod2 :: forall f. Foldable f => f Int -> Int
sumMod2 xs = mod (sum xs) 2

isSumEven :: forall f. Foldable => f Int -> Boolean
isSumEven = (==) 0 <<< sumMod2
```

### g:purescript_unicode_conceal_enable

```vim
let g:purescript_unicode_conceal_enable = 1
```

Enables concealing. Conceals as:

```purescript
sum ∷ ∀ a f. Foldable f ⇒ Semiring a ⇒ f a → a
sum = foldl (λa b → a + b) zero

sumMod2 ∷ ∀ f. Foldable f ⇒ f Int → Int
sumMod2 xs = mod (sum xs) 2

isSumEven ∷ ∀ f. Foldable ⇒ f Int → Boolean
isSumEven = (≡) 0 ∘ sumMod2
```

### g:purescript_unicode_conceal_disable_common

```vim
let g:purescript_unicode_conceal_disable_common = 1
```

Disables concealing common symbols and just uses ones the compiler supports. Concealed as:

```purescript
sum ∷ ∀ a f. Foldable f ⇒ Semiring a ⇒ f a → a
sum = foldl (\a b → a + b) zero

sumMod2 ∷ ∀ f. Foldable f ⇒ f Int → Int
sumMod2 xs = mod (sum xs) 2

isSumEven ∷ ∀ f. Foldable ⇒ f Int → Boolean
isSumEven = (==) 0 <<< sumMod2
```

### g:purescript_unicode_conceal_enable_discretionary

```vim
let g:purescript_unicode_conceal_enable_discretionary = 1
```

Enables discretionary symbols concealing less common symbols that deviate further from the written code. Concealed as:

```purescript
∑ ∷ ∀ a f. Foldable f ⇒ Semiring a ⇒ f a → a
∑ = foldl (λa b → a + b) ∅

sumMod2 ∷ ∀ f. Foldable f ⇒ f ℤ → ℤ
sumMod2 xs = mod (∑ xs) 2

isSumEven ∷ ∀ f. Foldable ⇒ f ℤ → 𝔹
isSumEven = (≡) 0 ∘ sumMod2
```

## Developing

Grab the suggested Git config by including with

```sh-session
$ git config --local include.path ../.gitconfig
```

This includes [`.git-blame-ignore-revs`](https://git-scm.com/docs/git-blame#Documentation/git-blame.txt---ignore-revs-fileltfilegt).

Enter Nix dev shell ([enable Flakes](https://nixos.wiki/wiki/Flakes) if needed)

```sh-session
$ nix develop
```

Or you can get an automatic shell via [`direnv`](https://direnv.net/)

```sh-session
$ echo "use flake" > .envrc
$ direnv allow
```

## Contributing

You can contribute to purescript-vim in several ways:

1. If you encounter a problem or have a question, please open an [issue](https://github.com/purescript-contrib/purescript-vim/issues) or post to the [mailing list](https://lists.sr.ht/~toastal/purescript-vim-discuss). We’ll do our best to work with you to resolve or answer it.

2. If you would like to contribute code, tests, or documentation, please read the [contributor guide](./CONTRIBUTING.md). It’s a short, helpful introduction to contributing to this library, including development instructions.

3. If you have written a library, tutorial, guide, or other resource based on this package, please share it on the [PureScript Discourse](https://discourse.purescript.org/)! Writing libraries and learning resources are a great way to help this library succ:eed.

[PureScript]: http://www.purescript.org
[Pathogen]: https://github.com/tpope/vim-pathogen
[idris-vim]: https://github.com/idris-hackers/idris-vim
[haskell-vim]: https://github.com/raichoo/haskell-vim
[vim-plug]: https://github.com/junegunn/vim-plug
[purescript-language-server]: https://github.com/nwolverson/purescript-language-server#vimcoc
