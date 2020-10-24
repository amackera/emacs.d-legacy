(use-package company
  :ensure t
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode 1)
  (use-package pos-tip
    :ensure t))
