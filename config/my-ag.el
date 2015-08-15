(use-package ag
  :commands (ag ag-files ag-regexp ag-project ag-project-files ag-project-regexp)
  :config
  (progn
    (setq ag-highlight-search t
          ag-reuse-buffers t)))

(provide 'my-ag)
