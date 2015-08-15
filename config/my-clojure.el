(use-package clojure-mode
  :ensure clojure-mode)

(use-package cider
  :ensure cider
  :config (progn
            ;; always eldoc in cider mode
            (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
            (add-hook 'cider-mode-hook '(paredit-mode +1))
            ))

(provide 'my-clojure)
