;; source: http://almostobsolete.net/daypage.html

(setq daypage-path "~/Dropbox/org-mode/daily/")

(defun find-daypage (&optional date)
  "Go to the day page for the specified date, 
   or toady's if none is specified."
  (interactive (list 
                (org-read-date "" 'totime nil nil
                               (current-time) "")))
  (setq date (or date (current-time)))
  (find-file 
       (expand-file-name 
        (concat daypage-path 
        (format-time-string "%Y-%m-%d" date) ".org")))
  (when (eq 0 (buffer-size))
        ;; Insert an initial for the page
        (insert (concat "* <" 
                        (format-time-string "%Y-%m-%d %a" date) 
                        "> Notes\n\n")
        (beginning-of-buffer)
        (next-line 2))))

(defun todays-daypage ()
  "Go straight to today's day page without prompting for a date."
  (interactive) 
  (find-daypage))

(defun log-daypage ()
  "The log page is a single page for input that is intended to stick
   around for a while."
  (interactive)
  (find-file
   (expand-file-name
    (concat daypage-path "log.org"))))

(provide 'daypages)
