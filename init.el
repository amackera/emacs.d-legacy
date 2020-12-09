
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(cond
 ((string-equal system-type "darwin")
  (progn
    (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")))
 ((string-equal system-type "gnu/linux")
  (progn
    (require 'cask "/usr/share/emacs/site-lisp/cask/cask.el"))))

(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; Run emacs as a server
(server-start)

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")
(load "setup-company.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-typescript.el")
(load "setup-ruby.el")
(load "setup-rails.el")
(load "setup-python.el")
(load "setup-yaml.el")
(load "setup-org.el")
(load "setup-web.el")
;; (load "setup-evil.el")

;; Revert all buffers
(load "revbufs.el")

;; Load Circe (IRC) config
(load "setup-circe.el")

(load "setup-magit.el")

;; For email
;(load "setup-mu4e.el")
;(pdf-loader-install)

;; For eshell
(load "setup-eshell.el")


;; ==========================
;; Begin use-package conversion
;; ==========================
(use-package direnv
 :config
 (direnv-mode))

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(global-set-key (kbd "C-x \\") 'align-regexp)

(require 'transpose-frame)

;; Terrible hack to fix profile mode bug: https://github.com/bbatsov/projectile/issues/1183
(add-hook 'after-init-hook 'global-company-mode)
(setq projectile-mode-line
      '(:eval (format " Projectile[%s(%s)]"
                      (projectile-project-name))))

(global-git-commit-mode)

;; This reverts files automatically
(global-auto-revert-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "074f60822c8a332b1500092daae2fe048e43a11072c70b6f0d249931bdbe55dc" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "c7eb06356fd16a1f552cfc40d900fe7326ae17ae7578f0ef5ba1edd4fdd09e58" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(ample-zen-theme gruvbox-theme zenburn-theme yaml-mode web-mode virtualenvwrapper use-package undo-tree tt-mode transpose-frame tide tagedit smooth-scrolling smex skewer-mode selectrum-prescient scss-mode rjsx-mode request-deferred realgud rainbow-delimiters pytest py-yapf projectile prettier-js prettier pipenv pdf-tools paredit pallet npm-mode multi-web-mode monokai-theme markdown-mode magit-popup magit jupyter json-mode jedi ido-completing-read+ hlinum graphql-mode ghub flyspell-correct flx-ido find-file-in-project exec-path-from-shell evil-org evil-collection emojify elpy ein doom-themes dockerfile-mode direnv company-quickhelp clojure-mode-extra-font-locking circe cider base16-theme aurora-config-mode ample-theme all-the-icons))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values '((cider-clojure-cli-global-options . "-A:env/test")))
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
