(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-model "claude-3.5-sonnet")
 '(package-selected-packages
   '(company-quickhelp spell-fu flycheck-aspell lua-mode docker-compose-mode dockerfile-mode pytest dap-mode blacken lsp-pyright go-mode lsp-jedi jedi elpy protobuf-mode clang-format solidity-flycheck solidity-mode pipenv poetry python-environment pyenv-mode lazy-ruff python-black copilot-chat copilot treemacs zig-mode markdown-preview-eww rainbow-mode rgb)))
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

(setq doom-font (font-spec :family "Hack" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Hack" :size 16))


(use-package spell-fu)
(spell-fu-global-mode)
(add-hook 'spell-fu-mode-hook
  (lambda ()
    (spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "ru"))
    (spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "en_US"))
    ;; (spell-fu-dictionary-add
    ;;  (spell-fu-get-personal-dictionary "nl-personal" "~/dotfiles/aspell.nl.pws"))
    ;; (spell-fu-dictionary-add
    ;;  (spell-fu-get-personal-dictionary "en-personal" "~/dotfiles/aspell.en.pws"))
))

(setq markdown-split-window-direction 'right)
(setq-default delete-by-moving-to-trash t)
(global-visual-line-mode t)
(setq-default delete-selection-mode 1)

(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

(add-hook 'python-mode-hook 'lsp)
(after! dap-mode
(require 'dap-python)
  (setq dap-python-debugger 'debugpy))
;; (require 'dap-python)
;; (setq dap-python-debugger 'debugpy)

(setq dap-python-executable "venv/bin/python")
(setq lsp-pyright-venv-path "venv")
(setenv "PYTHONPATH" (concat (expand-file-name "src") ":" (getenv "PYTHONPATH")))


(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(which-key-mode)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
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


(after! company
  (setq company-frontends '(company-pseudo-tooltip-frontend) ; Only use company's frontend
        company-idle-delay 0.2
        company-minimum-prefix-length 2))

;; (use-package company-quickhelp
;;   :ensure t
;;   :config
;;   (company-quickhelp-mode 1)
;;   (setq company-quickhelp-delay 0.5)) ; Delay before help popup appears

;; Disable other completion frameworks
(after! lsp-mode
  (setq lsp-completion-provider :none)) ; Disable LSP's completion

(after! evil
  (setq evil-complete-all-buffers nil)) ; Disable evil's completion

(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'text-mode-hook 'company-mode)

;; Disable other completion mechanisms
(add-hook 'prog-mode-hook (lambda () (setq-local completion-at-point-functions nil)))
(add-hook 'text-mode-hook (lambda () (setq-local completion-at-point-functions nil)))



;; init packages at start up
(package-initialize)
