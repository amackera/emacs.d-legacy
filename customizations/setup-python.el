(elpy-enable)
(add-hook 'python-mode-hook
     (lambda ()
       (setq tab-width 4)
               (setq python-shift-right 4)
               (setq python-shift-left 4)
               (setq python-indent 4)))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
