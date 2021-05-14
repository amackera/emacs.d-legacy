(require 'pyenv-mode)


(elpy-enable)

(add-hook 'python-mode-hook
     (lambda ()
       (setq tab-width 4)
       (setq python-shift-right 4)
       (setq python-shift-left 4)
       (setq python-indent 4)
       (pyenv-mode)))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)

; YAPF -- A Python formatter
(require 'py-yapf)

(require 'pytest)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'py-yapf-enable-on-save #'pipenv-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key "\C-c\C-ta" 'pytest-all)
            (local-set-key "\C-c\C-tm" 'pytest-module)
            (local-set-key "\C-c\C-t." 'pytest-one)
            (local-set-key "\C-c\C-tc" 'pytest-again)
            (local-set-key "\C-c\C-td" 'pytest-directory)
            (local-set-key "\C-c\C-tpa" 'pytest-pdb-all)
            (local-set-key "\C-c\C-tpm" 'pytest-pdb-module)
            (local-set-key "\C-c\C-tp." 'pytest-pdb-one)))


;; Have pytest capture sdtin
(setq elpy-test-pytest-runner-command '("py.test" "-s"))

;; Match on any appearance of a pdb or ipdb break point
(setq my-python-break-regexp "[i]?pdb.set_trace")

;; Use the new Emacs advice to search the current buffer for pdb/ipdb break points
;; only if the current buffer is derived from python-mode.  Call compile with comint
;; arg t if found.
(defun my-compile-advice (args)
  "Advises `compile' so it sets the argument COMINT to t
if breakpoints are present in `python-mode' files"
  (when (derived-mode-p major-mode 'python-mode)
    (save-excursion
      (save-match-data
        (goto-char (point-min))
        (if (re-search-forward my-python-break-regexp (point-max) t)
            ;; set COMINT argument to `t'.
            (let ((command (car args)))
              (setq args (list command t)))))))
  args)

(advice-add 'compile :filter-args #'my-compile-advice)
