Purescript Syntax/Indentation
=============================

Syntax highlighting and indentation for [Purescript][] based on [idris-vim][].

I hope you find this useful.

## Installation

I recommend using [Pathogen][] for installation. Simply clone
this repo into your `~/.vim/bundle` directory and you are ready to go.

    cd ~/.vim/bundle
    git clone https://github.com/raichoo/purescript-vim.git

### Manual Installation

Copy content into your `~/.vim` directory.

Be sure that the following lines are in your
`.vimrc`


    syntax on
    filetype on
    filetype plugin indent on

[Purescript]: http://www.purescript.org
[Pathogen]: https://github.com/tpope/vim-pathogen
[idris-vim]: https://github.com/idris-hackers/idris-vim
