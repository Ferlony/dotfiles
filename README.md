# Dotfiles

## doom emacs system requirements

```shell
sudo pacman -S ripgrep fd shellcheck && \
sudo npm install -g marked
```

Doom emacs installation

original repo
```
https://github.com/doomemacs/doomemacs
```

installation
```shell
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

Probably only doom/custom.el  
is needed

To enable python pyright lsp server need to install

``` shell
sudo npm i -g pyright
```


To enable word-wrap to new line without changing buffer
``` emacs-lisp

global-visual-line-mode 
```
