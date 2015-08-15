(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init (global-evil-leader-mode)
  :config (progn
            (evil-leader/set-leader "SPC")
            (evil-leader/set-key "/" 'evilnc-comment-or-uncomment-lines)
            (evil-leader/set-key "w" 'save-buffer)
            (evil-leader/set-key "q" 'kill-buffer-and-window)
            (evil-leader/set-key "h" 'dired-jump)
            (evil-leader/set-key "v" 'split-window-right)
            (evil-leader/set-key "e" 'pp-eval-last-sexp)
            ;(evil-leader/set-key "," 'other-window)
            (evil-leader/set-key "b" 'ibuffer)
            (evil-leader/set-key "x" 'helm-M-x)))

(use-package evil
  :ensure evil
  :config (progn
            (evil-mode 1)
            (setq evil-symbol-word-search t)
            (define-key evil-normal-state-map (kbd "C-S-h") 'help)
            (define-key evil-normal-state-map (kbd "S-q") 'evil-fill-and-move) ;; doesn't work =(
            (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
            (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
            (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
            (define-key evil-normal-state-map (kbd "C-;") 'evil-window-right)))

(provide 'my-evil)
