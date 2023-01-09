;;; setup-org -- Setting up org mode config

;;; Commentary:

;; Not much to add here

;;; Code:
(require 'org)

(setq org-directory "~/Library/CloudStorage/Dropbox/org/")
(setq org-default-notes-file "~/Library/CloudStorage/Dropbox/org/inbox.org")
(setq org-agenda-files '("~/Library/CloudStorage/Dropbox/org/"))

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
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (jupyter . t)))

(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/Library/CloudStorage/Dropbox/org/tasks.org" "Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

;; (setq org-todo-keywords
;;       '((sequence "TODO" "|" "DONE")))

(setq org-agenda-window-setup 'current-window)

;; Allows refile to make sense to me
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

;; Refile in a single go
(setq org-outline-path-complete-in-steps nil)

; Show full paths for refiling
(setq org-refile-use-outline-path t)
