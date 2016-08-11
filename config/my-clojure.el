(use-package clojure-mode
  :ensure clojure-mode
  :init (progn
          (evil-paredit-mode 1)
          (electric-pair-mode 1)))

(use-package cider
  :ensure cider
  :init (progn
          (evil-paredit-mode 1)
          (electric-pair-mode 1)))

(provide 'my-clojure)
