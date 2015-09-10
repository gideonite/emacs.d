(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

(defun keymap-forall-octave-modes ()
  (progn
    (evil-set-initial-state 'inferior-octave-mode 'normal)
    (evil-define-key 'normal inferior-octave-mode-map
      (kbd "C-j") 'evil-window-down
      (kbd "C-k") 'evil-window-up
      (kbd "C-h") 'evil-window-left
      (kbd "C-;") 'evil-window-right
      (kbd "<f1>") 'octave-help 
      (kbd "<f2>") 'octave-lookfor)))

(eval-after-load 'octave-mode
  (keymap-forall-octave-modes))

(eval-after-load 'inferior-octave-mode-map
  (keymap-forall-octave-modes))

(provide 'my-octave)
