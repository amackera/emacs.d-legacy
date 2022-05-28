;;; setup-racket.el --- Set up Racket files

;;; Commentary:

;;; Code:

(add-to-list 'load-path "~/.emacs.d/emacs-ob-racket")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (racket . t)))


(provide 'setup-racket)
;;; setup-racket.el ends here
