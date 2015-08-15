(use-package ess
  :ensure ess
  :init (progn
          (defun my-ess-eval-hook ()
            (evil-leader/set-key "e" 'ess-eval-region-or-function-or-paragraph-and-step))
          (add-hook 'ess-mode-hook 'my-ess-eval-hook)))

(require 'ess-site)

(provide 'my-ess)
