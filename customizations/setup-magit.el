(global-set-key (kbd "C-x g") 'magit-status)

(use-package magit
  :init (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
