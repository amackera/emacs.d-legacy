(require 'org)

(setq org-directory "~/Dropbox (Personal)/org/")
(setq org-default-notes-file "~/Dropbox (Personal)/org/inbox.org")
(setq org-agenda-files '("~/Dropbox (Personal)/org/"))

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
