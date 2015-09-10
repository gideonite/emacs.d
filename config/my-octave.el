(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

(eval-after-load 'octave-mode
  (progn
    (evil-set-initial-state 'octave-mode 'normal)
    (evil-define-key 'normal octave-mode-map
      (kbd "<f1>") 'octave-help 
      (kbd "<f2>") 'octave-lookfor)))

(eval-after-load 'inferior-octave-mode-map
  (progn
    (evil-set-initial-state 'inferior-octave-mode 'normal)
    (evil-define-key 'normal inferior-octave-mode-map
      (kbd "<f1>") 'octave-help 
      (kbd "<f2>") 'octave-lookfor)))

(provide 'my-octave)
