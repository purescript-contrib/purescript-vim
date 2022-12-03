# purescript-vim

[PureScript][] language support for vim and neovim providing syntax highlighting and indentation based on based on [idris-vim][] and [haskell-vim][].

See [purescript-language-server][] for details on how to set up language server support for [PureScript][].

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

If you have vim version 8 (`vim --version | head -n1`), you can install plugins with the native pack system:

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

## Unicode conceal

If you wish to have some symbols concealed for their unicode equivalents, you may use these options. Each setting will conceal the following ASCII code block for an example output.

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

## Contributing

Contributing checklist:

- [ ] Opened an issue before investing a significant amount of work into changes
- [ ] Update README.md with any new configuration options and behavior
- [ ] Update CHANGELOG.md with the proposed changes
- [ ] Run `generate-doc.sh` to re-generate the documentation

[PureScript]: http://www.purescript.org
[Pathogen]: https://github.com/tpope/vim-pathogen
[idris-vim]: https://github.com/idris-hackers/idris-vim
[haskell-vim]: https://github.com/raichoo/haskell-vim
[vim-plug]: https://github.com/junegunn/vim-plug
[purescript-language-server]: https://github.com/nwolverson/purescript-language-server#vimcoc
