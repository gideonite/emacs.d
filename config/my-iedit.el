(require 'iedit)

;; source: https://www.masteringemacs.org/article/iedit-interactive-multi-occurrence-editing-in-your-buffer
;; edit variables by scope, not by string matching
(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))

(global-set-key (kbd "C-:") 'iedit-dwim)

(provide 'my-iedit)
