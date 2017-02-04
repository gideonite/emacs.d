(require 'mu4e)

(setq mu4e-maildir "~/Maildir/dgideon")

(setq mu4e-sent-messages-behavior 'sent)

(setq
 user-mail-address "dgideon@student.ethz.ch"
 user-full-name  "Gideon Dresdner")

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
   smtpmail-starttls-credentials '(("mail.ethz.ch" 587 nil nil))
   smtpmail-auth-credentials
     '(("mail.ethz.ch" 587 "dgideon@student.ethz.ch" nil))
   smtpmail-default-smtp-server "mail.ethz.ch"
   smtpmail-smtp-server "mail.ethz.ch"
   smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq mu4e-view-show-images t)

(setq mu4e-view-show-addresses t)

(add-to-list 'mu4e-bookmarks
  '("NOT flag:list AND (flag:unread OR flag:flagged)"          "Important emails"            ?i))
(add-to-list 'mu4e-bookmarks
  '("flag:flagged"                                             "Flagged emails"              ?f))

(setq mu4e-attachment-dir  "/tmp/downloads")

(defun no-auto-fill ()
  "Turn off auto-fill-mode."
  (auto-fill-mode -1))

(add-hook 'mu4e-compose-mode-hook #'no-auto-fill)

(provide 'my-mu4e)
