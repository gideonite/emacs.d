;; I'm not sure if setting these global variables within a hook is the
;; right way to go about it. Perhaps it should just be done once and
;; for all when emacs loads?
(add-hook 'org-mode-hook (lambda ()
                           (progn
                             (load "/home/gideon/.emacs.d/config/ob-julia.el")
                             (setq  inferior-julia-program-name "/usr/bin/julia")
                             (setq org-confirm-babel-evaluate nil)
                             (setq org-src-fontify-natively t)
                             ;; More on julia-write-object-command here: https://github.com/gjkerns/ob-julia/issues/2.
                             (setq org-babel-julia-write-object-command
                                   "wout(fn,o) = if try isa(typeof(o), Type{DataFrames.DataFrame}) catch; false end; DataFrames.writetable(fn, DataFrames.head(o)); else; writecsv(fn,o); end; wout(\"%s\",%s)"))))

(provide 'my-org)
