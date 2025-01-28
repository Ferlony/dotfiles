(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-model "gpt-4o")
 '(package-selected-packages
   '(go-mode lsp-jedi jedi elpy protobuf-mode clang-format solidity-flycheck solidity-mode pipenv poetry python-environment pyenv-mode lazy-ruff python-black lsp-pyright copilot-chat copilot treemacs zig-mode markdown-preview-eww rainbow-mode rgb)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (add-hook 'web-mode-hook #'rainbow-mode)

;; (define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
;;   (lambda () (rainbow-mode 1)))
;; 
;; (my-global-rainbow-mode 1)

(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))


(setq markdown-split-window-direction 'right)

(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

(add-hook 'python-mode-hook 'lsp)
(add-hook 'cpp-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'cs-mode-hook 'lsp)


;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;; init packages at start up
(package-initialize)
