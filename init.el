(require 'package)
(package-initialize)
(setq package-initialize-at-startup nil)

(add-to-list 'load-path (concat user-emacs-directory "config")) (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                                                                                         ("org"   . "http://orgmode.org/elpa/")
                                                                                         ("gnu"   . "http://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(setq-default c-basic-offset 4)

(load-theme 'solarized-dark t)

(setq visible-bell 1)

(global-visual-line-mode 1)

(setq require-final-newline t)

(setq-default tab-width 4 indent-tabs-mode nil)

(tool-bar-mode -1)

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; disabled -> enabled since emacs starts with word wrap off.
(toggle-word-wrap)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-right>") 'shrink-window-horizontally)

;; overried "yes" or "no" prompts to always be "y" or "n" prompts
(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))                              ; put files~ in backup dir
      auto-save-file-name-directory '(("." . "~/.emacs.d/backup"))
      auto-save-file-name-transforms `(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/tmp/\\2" t))
      ;`((".*" ,(expand-file-name "~/.emacs.d/backups/" t))) ; put #files in backup dir

      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

(defun reload ()
  "Reloads emacs config"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun initel ()
  "Shortcut to open `init.el` in a new buffer"
  (interactive)
  (progn
    (find-file "~/.emacs.d/init.el")
    (switch-to-buffer "init.el")))

(ido-mode t)

;; (desktop-save-mode 1)
;;(setq desktop-files-not-to-save "\\(^/*:\\|(ftp)$\\)") Want to save tramp sessions too.
;; (setq desktop-files-not-to-save "^$")

;; Automatically save and restore sessions
:; https://stackoverflow.com/questions/4477376/some-emacs-desktop-save-questions-how-to-change-it-to-save-in-emacs-d-emacs
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)
(desktop-save-mode 1)

(setq x-select-enable-clipboard t)

(setq tramp-default-method "ssh")

(setq vc-handled-backends (remove 'Git vc-handled-backends))

(require 'my-lib)

(require 'my-slime)

(require 'my-evil)

(require 'my-octave)

(require 'my-ibuffer)

(require 'my-dired)

(require 'my-ess)

(require 'my-javascript)

(require 'my-clojure)

(require 'my-org)

(require 'my-autocomplete)

(require 'my-ag)

(require 'my-python)

(require 'my-iedit)

;; (require 'my-mu4e)

(require 'daypages)

(progn
  ;; my ispell
  (setq ispell-program-name "/usr/local/bin/aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))

(setenv "PATH" (concat "/Library/TeX/texbin" (getenv "PATH")))
(setq exec-path (append '("/Library/TeX/texbin") exec-path))

(setq exec-path (append exec-path '("/Users/gideon/anaconda3/bin/")))

(savehist-mode 1)

(auto-revert-mode 1)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "open")

;; undo-tree
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist `(("." . ,(expand-file-name "~/.emacs-undo/"))))

;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Activate nice interface between RefTeX and AUCTeX
(setq reftex-plug-into-AUCTeX t)

;; TODO seems cool but can't figure out how it works.
;; (defadvice undo-tree-make-history-save-file-name
;;   (after undo-tree-compressed activate)
;;   (setq ad-return-value (concat ad-return-value ".gz")))﻿

(set-face-attribute 'default nil :family "Anonymous Pro" :height 140) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(find-file-wildcards t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(org-latex-preview-ltxpng-directory "/tmp/emacs-ltxpng/ltxpng/")
 '(package-selected-packages
   (quote
    (auto-complete lua-mode wc-mode zotxt xclip wgrep-ag virtualenvwrapper use-package tramp-term solarized-theme slime-volleyball slime racket-mode quack pylint pretty-lambdada pinyinlib pdf-tools markdown-mode magit js3-mode js2-refactor js2-closure jekyll-modes imenu-anywhere iedit helm geiser folding flycheck expand-region evil-paredit evil-leader ess elisp-slime-nav dumb-jump dockerfile-mode db-pg company clojure-mode-extra-font-locking cdlatex auctex ac-octave ac-math ac-js2 ac-cider)))
 '(save-place t nil (saveplace))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))
