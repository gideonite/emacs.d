(require 'package)
(package-initialize)
(setq package-initialize-at-startup nil)

(add-to-list 'load-path (concat user-emacs-directory "config")) (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                                                                                         ("org" . "http://orgmode.org/elpa/")
                                                                                         ("gnu" . "http://elpa.gnu.org/packages/")))

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
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      auto-save-file-name-directory '(("." . "~/.emacs.d/backup"))
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

(progn
  ;; my ispell
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))

;; source: https://www.masteringemacs.org/article/iedit-interactive-multi-occurrence-editing-in-your-buffer
;; edit variables by scope, not by string matching
(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))
(global-set-key (kbd "C-:") 'iedit-dwim)

(setq exec-path (append exec-path '("/usr/bin/pdflatex")))

(savehist-mode 1)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")

;; undo-tree
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist `(("." . ,(expand-file-name "~/.emacs-undo/"))))
;; TODO seems cool but can't figure out how it works.
;; (defadvice undo-tree-make-history-save-file-name
;;   (after undo-tree-compressed activate)
;;   (setq ad-return-value (concat ad-return-value ".gz")))﻿

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
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
