(eval-after-load "org-mode"
  ;; load files, require symbols.

  (progn
    (load "/home/gideon/.emacs.d/config/ob-julia.el")
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

    ;; fix text color
    (setq org-format-latex-options
          (plist-put org-format-latex-options :background "White"))

    ;; load babel languages
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
       (R . t)
       (octave . t)))))

(after 'org-mode
  (progn
    (setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
    (org-cdlatex-mode)))

(provide 'my-org)
