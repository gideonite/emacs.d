(eval-after-load 'org-mode
  '(progn
     (add-hook 'org-mode-hook
               (lambda ()
                 (progn
                   (load "/home/gideon/.emacs.d/config/ob-julia.el")
                   (org-cdlatex-mode)
                   (setq  inferior-julia-program-name "/usr/bin/julia")
                   (setq org-confirm-babel-evaluate nil)
                   (setq org-src-fontify-natively t)

                   ;; More on
                   ;; julia-write-object-command here:
                   ;; https://github.com/gjkerns/ob-julia/issues/2.
                   (setq org-babel-julia-write-object-command
                         "wout(fn,o) = if try isa(typeof(o),
                                        Type{DataFrames.DataFrame})
                                        catch; false end;
                                        DataFrames.writetable(fn,
                                        DataFrames.head(o)); else;
                                        writecsv(fn,o); end;
                                        wout(\"%s\",%s)")
                   ;; increase size of the latex preview font.
                   (setq org-format-latex-options
                         (plist-put org-format-latex-options :scale 1.75))

                   ;; load babel languages
                   (org-babel-do-load-languages
                    'org-babel-load-languages
                    '((python . t)
                      (R . t))))))))

(provide 'my-org)
