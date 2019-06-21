(use-package org
  :ensure t
  :config (progn
            (setq org-agenda-files (mapcar 'file-truename
                                           '("~/Dropbox/org-mode/mobile/projects.org")))

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

                                        ; timestamp when a TODO becomes a DONE.
            (setq org-log-done 'time)

            (setq org-todo-keywords
                  '((sequence "TODO" "|" "DONE" "ABORTED")))

            (setq org-agenda-skip-scheduled-if-done t)

            (defun my-org-mode-hook ()
              (progn
                (setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
                (interactive)
                (org-cdlatex-mode)
                (reftex-mode)))

            (add-hook 'org-mode-hook
                      'my-org-mode-hook)))

(provide 'my-org)
