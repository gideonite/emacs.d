(defun filter (condp src-list)
  (defun helper (condp src-list target-list)
    (if (eq '() src-list)
        target-list
      (if (funcall condp (car src-list))
          (helper condp (cdr src-list) (cons (car src-list) target-list))
        (helper condp (cdr src-list) target-list))))
  (helper condp src-list '()))

;; (filter
;;  (lambda (b)
;;    (eq (with-current-buffer (nth 7 (buffer-list)) major-mode)
;;        (with-current-buffer b major-mode)))
;;  (buffer-list))

(provide 'my-lib)
