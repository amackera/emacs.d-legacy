
;; Enable Evil mode
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(require 'evil)
(add-to-list 'load-path "~/.emacs.d/evil")
(load "setup-evil.el")
(evil-mode 1)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
 (evil-org-set-key-theme '(navigation insert textobjects additional calendar todo))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)
