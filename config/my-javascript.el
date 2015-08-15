(use-package ac-js2
  :ensure ac-js2
  :mode "\\.js\\'")

(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js\\'"
  :init
  (progn
    (custom-set-variables  
     '(js2-basic-offset 2)  
     '(js2-bounce-indent-p t))

    (add-hook 'js-mode-hook 'js2-mode)
    (add-hook 'js2-mode-hook 'ac-js2-mode)))

(provide 'my-javascript)
