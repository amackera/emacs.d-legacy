(require 'org)

(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "~/Dropbox/org/inbox.org")
(setq org-agenda-files '("~/Dropbox/org/"))

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(add-hook 'org-mode-hook #'(lambda ()
                             ;; make the lines in the buffer wrap around the edges of the screen.
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)
                             (org-indent-mode)))
