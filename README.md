# Dotfiles

## doom emacs system requirements

```shell
sudo pacman -S ripgrep fd shellcheck && \
sudo npm install -g marked
```

To enable python pyright lsp server need to install

``` shell
sudo npm i -g pyright
```


To enable word-wrap to new line without changing buffer
``` emacs-lisp

global-visual-line-mode 
```
