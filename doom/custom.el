;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-model "claude-3.7-sonnet-thought")
 '(package-selected-packages
   '(copilot copilot-chat csv-mode dape go-mode highlight indent-guide lsp-pyright
     protobuf-mode pytest rainbow-mode spell-fu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Go lsp
(add-to-list 'exec-path (expand-file-name "~/go/bin"))

;; debugpy args
;;# Launch/Attach Settings
;;
;;## Overview
;;
;;These are the settings that you would use in the Launch/Attach Request in any DAP client.
;;
;;## Code Execution Settings
;;
;;| Property | Type          | Configuration | Description                                                                                                                                                           |
;;| -------- | ------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
;;| module   | string        | Launch        | Name of the module to be debugged.                                                                                                                                    |
;;| program  | string        | Launch        | Absolute path to the program.                                                                                                                                         |
;;| code     | string        | Launch        | Code to execute in string form. Example: `"code": "import debugpy;print(debugpy.__version__)"`                                                                        |
;;| python   | Array[string] | Launch        | Path python executable and interpreter arguments. Example: `"python": ["/usr/bin/python", "-E"]`, For arguments to your script use "args".                            |
;;| args     | Array[string] | Launch        | Command line arguments passed to the program. Example: `"args": ["--arg1", "-arg2", "val", ...]`                                                                      |
;;| console  | Enum          | Launch        | Supported values `["internalConsole", "integratedTerminal", "externalTerminal"]`. Sets where to launch the debug target. Default is `"integratedTerminal"`.           |
;;| cwd      | string        | Launch        | Absolute path to the working directory of the program being debugged.                                                                                                 |
;;| env      | Object        | Launch        | Environment variables defined as a key value pair. Property ends up being the Env Variable and the value of the property ends up being the value of the Env Variable. |
;;
;;## Debugger Settings
;;
;;| Property        | Type          | Configuration | Description                                                                                                                      |
;;| --------------- | ------------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------- |
;;| django          | Boolean       | Launch/Attach | When `true` enables Django templates. Default is `false`.                                                                        |
;;| gevent          | Boolean       | Launch/Attach | When `true` enables debugging of gevent monkey-patched code. Default is `false`.                                                 |
;;| jinja           | Boolean       | Launch/Attach | When `true` enables Jinja2 template debugging (e.g. Flask). Default is `false`.                                                  |
;;| justMyCode      | Boolean       | Launch/Attach | When `true` debug only user-written code. To debug standard library or anything outside of "cwd" use `false`. Default is `true`. |
;;| logToFile       | Boolean       | Launch/Attach | When `true` enables logging of debugger events to a log file(s). Default is `false`.                                             |
;;| pathMappings    | Array[Object] | Launch/Attach | Map of local and remote paths. Example: `"pathMappings": [{"localRoot": "local path", "remoteRoot": "remote path"}, ...]`.       |
;;| pyramid         | Boolean       | Launch/Attach | When `true` enables debugging Pyramid applications. Default is `false`.                                                          |
;;| redirectOutput  | Boolean       | Launch/Attach | When `true` redirects output to debug console. Default is `false`.                                                               |
;;| showReturnValue | Boolean       | Launch/Attach | Shows return value of functions when stepping. The return value is added to the response to Variables Request                    |
;;| stopOnEntry     | Boolean       | Launch        | When `true` debugger stops at first line of user code. When `false` debugger does not stop until breakpoint, exception or pause. |
;;| subProcess      | Boolean       | Launch/Attach | When `true` enables debugging multiprocess applications. Default is `true`.                                                      |
;;| sudo            | Boolean       | Launch/Attach | When `true` runs program program under elevated permissions (on Unix). Default is `false`.                                       |
;;
;;## Examples
;;

(require 'dape)
(add-to-list 'dape-configs
             `(debugpy
               modes (python-ts-mode python-mode)
               command "python"
               command-args ("-m" "debugpy.adapter")
               :type "executable"
               :request "launch"
	       :console "integratedTerminal"
	       :showReturnValue nil ;;t
	       :justMyCode nil
               :cwd dape-cwd-fn
               ;;:program dape-find-file-buffer-default
               ))


(setq dape-config-pytest '((mode . "python")
                           (command . "python")
                           (args . ("-m" "debugpy.adapter" "--wait-for-client" "--" "pytest" "-s" "-v"))))

(setq doom-font (font-spec :family "Hack" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Hack" :size 16))


(setq markdown-split-window-direction 'right)
(setq-default delete-by-moving-to-trash t)
(global-visual-line-mode t)
(setq-default delete-selection-mode 1)


(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))


(add-hook 'python-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'csharp-mode-hook 'lsp)
(add-hook 'go-mode-hook #'lsp-deferred)


(after! company
  (setq company-frontends '(company-pseudo-tooltip-frontend)
        company-idle-delay 0.1
        company-minimum-prefix-length 1))

;(use-package company-quickhelp
;  :ensure t
;  :config
;  (company-quickhelp-mode 1)
;  (setq company-quickhelp-delay 0.5)) ; Delay before help popup appears


(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))


;;(with-eval-after-load 'copilot
;;  (defun copilot--infer-indentation-offset ()
;;    (or (copilot--get-indentation-offset-from-mode)
;;        (copilot--get-indentation-offset-from-buffer)
;;        4))) ; Default to 4 spaces if no offset is found


(package-initialize)
