(use-package auto-complete
  :config (progn
            (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
            (require 'auto-complete-config)
            (ac-config-default)
            (global-auto-complete-mode t)))

(provide 'my-autocomplete)
