(eval-after-load "org-mode"
  ;; load files, require symbols.

  (progn

    (setq org-confirm-babel-evaluate nil)
    (setq org-src-fontify-natively t)

    ;; increase size of the latex preview font.
    (setq org-format-latex-options
          (plist-put org-format-latex-options :scale 1.75))

    ;; fix text color
     (setq org-format-latex-options
           (plist-put org-format-latex-options :background "#002b36")) ;; this is solarized background black.

    ; display/update images in the buffer after I evaluate
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

    ;; Julia stuff
    ;; (load "/home/gideon/.emacs.d/config/ob-julia.el")
    ;; (setq  inferior-julia-program-name "/usr/bin/julia")
    ;; ;; More on
    ;; ;; julia-write-object-command here:
    ;; ;; https://github.com/gjkerns/ob-julia/issues/2.
    ;; (setq org-babel-julia-write-object-command
    ;;       "wout(fn,o) = if try isa(typeof(o),
    ;;                                     Type{DataFrames.DataFrame})
    ;;                                     catch; false end;
    ;;                                     DataFrames.writetable(fn,
    ;;                                     DataFrames.head(o)); else;
    ;;                                     writecsv(fn,o); end;
    ;;                                     wout(\"%s\",%s)")

    ;; (require 'ob-ipython)

    ; timestamp when a TODO becomes a DONE.
    (setq org-log-done 'time)

    ;; load babel languages
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
       ;;(ipython . t)
       (R . t)
       (octave . t)))

    (setq org-todo-keywords
          '((sequence "TODO" "|" "DONE" "ABORTED")))))

(defun my-org-mode-hook ()
   (progn
    (setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
    (interactive)
    (org-cdlatex-mode)
    (reftex-mode)))

(add-hook 'org-mode-hook
          'my-org-mode-hook)

(provide 'my-org)
