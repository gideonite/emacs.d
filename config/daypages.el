;; source: http://almostobsolete.net/daypage.html

(setq org-mode-path "~/Dropbox/org-mode/")
(setq daypage-path (concat org-mode-path "daily/"))

(defun find-daypage (&optional date)
  "Go to the day page for the specified date, 
   or toady's if none is specified."
  (interactive (list 
                (org-read-date "" 'totime nil nil
                               (current-time) "")))
  (setq date (or date (current-time)))
  (find-file-other-frame
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

;; (defun todays-daypage ()
;;   "Go straight to today's day page without prompting for a date."
;;   (interactive) 
;;   (find-daypage))

;; (defun meetings-daypage ()
;;   "Go to the page that keeps track of meetings."
;;   (interactive)
;;   (find-file
;;    (expand-file-name
;;     (concat org-mode-path "meetings.org"))))

(provide 'daypages)
