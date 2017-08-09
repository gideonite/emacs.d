;;(use-package python-mode
;;  ; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;;  :init (progn
;;          ;; python shell
;;          (setq
;;           python-shell-interpreter "ipython"
;;           ;; python-shell-interpreter-args "--gui=wx --matplotlib=wx --colors=Linux" TODO waiting for project phoneix, until then prefer python3 over fancy plotting.
;;           python-shell-interpreter-args "-i --colors=Linux --simple-prompt"
;;           ; http://www.jesshamrick.com/2013/03/31/macs-and-emacs/
;;           ;(if (system-is-mac)
;;           ;    "--matplotlib=osx --colors=Linux"
;;           ;  (if (system-is-linux)
;;           ;      "--gui=wx --matplotlib=wx --colors=Linux")
;;           ;  )
;;           python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;           python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;           python-shell-completion-setup-code
;;           "from IPython.core.completerlib import module_completion"
;;           python-shell-completion-module-string-code
;;           "';'.join(module_completion('''%s'''))\n"
;;           python-shell-completion-string-code
;;           "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
;;
;;          ;; ;; pymacs
;;          ;; (add-to-list 'load-path "~/.emacs.d/pymacs-0.25")
;;          ;; (autoload 'pymacs-apply "pymacs")
;;          ;; (autoload 'pymacs-call "pymacs")
;;          ;; (autoload 'pymacs-eval "pymacs" nil t)
;;          ;; (autoload 'pymacs-exec "pymacs" nil t)
;;          ;; (autoload 'pymacs-load "pymacs" nil t)
;;          ;; (autoload 'pymacs-autoload "pymacs")
;;
;;          ;; ropemacs
;;          ;; (require 'pymacs)
;;          ;; (pymacs-load "ropemacs" "rope-")
;;          ))


(setq python-shell-interpreter "ipython"
      ;;python-shell-interpreter-args "-i --simple-prompt"
      )

(setq ansi-color-for-comint-mode t)

(provide 'my-python)
