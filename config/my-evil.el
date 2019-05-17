(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init (global-evil-leader-mode)
  :config (progn
            (evil-leader/set-leader "SPC")
            (evil-leader/set-key "/" 'comment-or-uncomment-region)
            (evil-leader/set-key "w" 'save-buffer)
            (evil-leader/set-key "q" 'kill-buffer-and-window)
            (evil-leader/set-key "n" 'make-frame)
            (evil-leader/set-key "h" 'dired-jump)
            (evil-leader/set-key "v" 'split-window-right)
            (evil-leader/set-key "c" 'split-window-below)
            (evil-leader/set-key "e" 'pp-eval-last-sexp)
            ;(evil-leader/set-key "," 'other-window)
            (evil-leader/set-key "b" 'ibuffer)
            (evil-leader/set-key "x" 'helm-M-x)))

(use-package evil
  :ensure evil
  :config (progn
            (evil-mode 1)
            (setq-default evil-symbol-word-search t)
            (define-key evil-normal-state-map (kbd "C-S-h") 'help)
            (define-key evil-normal-state-map (kbd "S-q") 'evil-fill-and-move) ;; doesn't work =(
            (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
            (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
            (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
            (define-key evil-normal-state-map (kbd "C-;") 'evil-window-right)
            (define-key evil-normal-state-map (kbd "C-N") 'next-buffer)
            (define-key evil-normal-state-map (kbd "C-P") 'previous-buffer)

            ;; macro to insert ipdb.set_trace()
            (evil-set-register ?p [?o ?i ?m ?p ?o ?r ?t ?  ?i ?p ?d ?b ?\; ?  ?i ?p ?d ?b ?. ?s ?e ?t ?_ ?t ?r ?a ?c ?e ?\( ?\) escape])
            ))

(provide 'my-evil)
