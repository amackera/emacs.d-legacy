;; javascript / html
;;(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;;(add-hook 'js-mode-hook 'subword-mode)
;;(add-hook 'html-mode-hook 'subword-mode)
;;(setq js-indent-level 2)
;;(eval-after-load "sgml-mode"
;;  '(progn
;;     (require 'tagedit)
;;     (tagedit-add-paredit-like-keybindings)
;;     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
;;

;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-enable-auto-quoting nil)

;; coffeescript
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook
          (defun coffee-mode-newline-and-indent ()
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
            (setq coffee-cleanup-whitespace nil)))
(custom-set-variables
 '(coffee-tab-width 2))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-attr-indent-offset 2)
