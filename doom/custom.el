(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-model "gpt-4o")
 '(package-selected-packages
   '(docker-compose-mode dockerfile-mode pytest dap-mode omnisharp blacken lsp-pyright go-mode lsp-jedi jedi elpy protobuf-mode clang-format solidity-flycheck solidity-mode pipenv poetry python-environment pyenv-mode lazy-ruff python-black copilot-chat copilot treemacs zig-mode markdown-preview-eww rainbow-mode rgb)))
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

(add-to-list 'exec-path (expand-file-name "~/go/bin"))

(setq doom-font (font-spec :family "Hack" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Hack" :size 15))


(setq markdown-split-window-direction 'right)
(setq-default delete-by-moving-to-trash t)
(global-visual-line-mode t)
(delete-selection-mode 1)

(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

(add-hook 'python-mode-hook 'lsp)
(add-hook 'cpp-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'cs-mode-hook 'lsp)


(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
;;(defun lsp-go-install-save-hooks ()
;;  (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;  (add-hook 'before-save-hook #'lsp-organize-imports t t))
;;(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


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
