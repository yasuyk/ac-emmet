## Synopsis

auto-complete sources for [emmet-mode][emmet-mode]'s snippets

## Requirements

- [auto-complete][auto-complete]
- [emmet-mode][emmet-mode]

## Installation


First, ensure `auto-complete` and `emmet-mode` are installed: I recommend
using packages from [Melpa][melpa].

You'll need both `auto-complete` and `emmet-mode` to be enabled and
working, so please consult the corresponding documentation is you have
any trouble with this.

Next, install`ac-emmet`. If you choose not to use the convenient
package in [Melpa][melpa], you'll need to add the directory containing
`ac-emmet.el` to your `load-path`, and then `(require 'ac-emmet)`.

`ac-emmet` provides an `emmet`-specific completion source,
so `auto-complete` needs to be told to use them when `emmet-mode` is
active. To do this, put the following code in your emacs init file to

     (require 'ac-emmet) ;; Not necessary if using ELPA package
     (add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
     (add-hook 'css-mode-hook 'ac-emmet-css-setup)

## Usage

`ac-emmet` should now automatically be enabled when you visit a buffer
in which `emmet-mode` is active and `auto-complete` is enabled. (The
symbols "Emmet and "AC" should appear in the modeline.)


[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.milkbox.net
[auto-complete]:https://github.com/auto-complete/auto-complete
[emmet-mode]:https://github.com/smihica/emmet-mode
