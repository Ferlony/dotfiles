(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-model "claude-3.7-sonnet-thought")
 '(package-selected-packages
   '(blacken clang-format company-quickhelp copilot copilot-chat csv-mode dap-mode
     docker-compose-mode dockerfile-mode elpy flycheck-aspell go-mode
     highlight-indent-guides indent-guide jedi lazy-ruff lsp-jedi lsp-pyright
     lua-mode markdown-preview-eww pipenv poetry protobuf-mode pyenv-mode pytest
     python-black python-environment rainbow-mode rgb solidity-flycheck
     solidity-mode spell-fu treemacs zig-mode)))
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

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)


(setq markdown-split-window-direction 'right)
(setq-default delete-by-moving-to-trash t)
(global-visual-line-mode t)
(setq-default delete-selection-mode 1)

(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))


(add-hook 'python-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)


(use-package! dap-mode
  :after lsp-mode
  :config
  ;; Enable Python debugging
  (require 'dap-python)

  ;; Configure debugpy
  (setq dap-python-debugger 'debugpy
        dap-python-executable "python")  ;; or "python" if that's your command

  ;; Debug template
  ;;(dap-register-debug-template
  ;; "Python Debug"
  ;; (list :type "python"
  ;;       :request "launch"
  ;;       :name "Python Debug"
  ;;       :program "${file}"
  ;;       :pythonArgs ""
  ;;       :console "integratedTerminal"
  ;;       :cwd "${fileDirname}"))
  )

(setq dap-auto-configure-features '(sessions locals breakpoints expressions controls))


;; (setq dap-python-executable "venv/bin/python")
;;(setq lsp-pyright-venv-path "venv")
;;(setenv "PYTHONPATH" (concat (expand-file-name "src") ":" (getenv "PYTHONPATH")))


(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(which-key-mode)


(defun my/lsp-shutdown-all-workspaces ()
  "Shutdown all active LSP workspaces."
  (interactive)
  (dolist (ws (lsp-workspaces))
    (lsp-workspace-shutdown ws)))


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
        company-idle-delay 0.1
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


;; Keep Treemacs static
(setq treemacs-follow-after-init nil    ; Don't follow file on init
      treemacs-follow-mode nil         ; Don't auto-follow selections
      treemacs-quit-on-file-select nil) ; Don't close Treemacs when opening a file


;; init packages at start up
(package-initialize)
