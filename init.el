
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(cond
 ((string-equal system-type "darwin")
  (progn
    (require 'cask "/opt/homebrew/share/emacs/site-lisp/cask/cask.el")))
 ((string-equal system-type "gnu/linux")
  (progn
    (require 'cask "/usr/share/emacs/site-lisp/cask/cask.el"))))

(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; Run emacs as a server
(server-start)

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
;; (load "setup-ruby.el")
;; (load "setup-rails.el")
(load "setup-python.el")
(load "setup-yaml.el")
(load "setup-org.el")
(load "setup-web.el")
(load "setup-auctex.el")
;; (load "setup-evil.el")

;; Revert all buffers
;; (load "revbufs.el")

;; Load Circe (IRC) config
;; (load "setup-circe.el")

(load "setup-magit.el")

;; For email
                                        ;(load "setup-mu4e.el")
;; (load "~/.emacs.d/mu4e/config.el")
;(pdf-loader-install)

;; For eshell
(load "setup-eshell.el")

(load "screenshot.el")

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

;; ==========================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(auto-save-default nil)
 '(custom-safe-themes
   '("17a58e509bbb8318abf3558c4b7b44273b4f1b555c5e91d00d4785b7b59d6d28" "620b9018d9504f79344c8ef3983ea4e83d209b46920f425240889d582be35881" "78c01e1b7f3dc9e47bdd48f74dc98dc1a345c291f83b68ac8a1b40191f24d658" "7236acec527d58086ad2f1be6a904facc9ca8bf81ed1c19098012d596201b3f1" "0769aa1641a0dcd5043e37ab22c401da838ff30b015da104c87cce1573d4c3ef" "a4395e069de3314001de4e139d6a3b1a83dcf9c3fdc68ee7b13eef6c2cba4ae3" "0c6a36393d5782839b88e4bf932f20155cb4321242ce75dc587b4f564cb63d90" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "074f60822c8a332b1500092daae2fe048e43a11072c70b6f0d249931bdbe55dc" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "c7eb06356fd16a1f552cfc40d900fe7326ae17ae7578f0ef5ba1edd4fdd09e58" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults))
 '(elpy-test-runner 'elpy-test-pytest-runner)
 '(package-selected-packages
   '(racket-mode auctex-latexmk auctex org-mime org-msg org-mime flycheck-clj-kondo fira-code-mode kaolin-themes ample-zen-theme gruvbox-theme zenburn-theme yaml-mode web-mode virtualenvwrapper use-package undo-tree tt-mode transpose-frame tide tagedit smooth-scrolling smex skewer-mode selectrum-prescient scss-mode rjsx-mode request-deferred realgud rainbow-delimiters pytest py-yapf projectile prettier-js prettier pipenv pdf-tools paredit pallet npm-mode multi-web-mode monokai-theme markdown-mode magit-popup magit jupyter json-mode jedi hlinum graphql-mode ghub flyspell-correct find-file-in-project exec-path-from-shell evil-org evil-collection emojify elpy ein doom-themes dockerfile-mode direnv company-quickhelp clojure-mode-extra-font-locking circe cider base16-theme aurora-config-mode ample-theme all-the-icons))
 '(safe-local-variable-values
   '((cider-clojure-cli-aliases . "dev")
     (cider-shadow-watched-builds "admin" "client" "organization")
     (cider-clojure-cli-global-options . "-A:test:dev")
     (cider-shadow-watched-builds "admin" "customer" "firm")
     (cider-clojure-cli-aliases . "test")
     (cider-clojure-cli-aliases . "-A:dev")
     (cider-clojure-cli-global-options . "-A:dev")
     (cider-shadow-default-options . "frontend")
     (cider-shadow-watched-builds "frontend")
     (cider-shadow-default-options . "admin")
     (cider-shadow-watched-builds "admin" "customer")
     (cider-preferred-build-tool . clojure-cli)
     (cider-clojure-cli-aliases . "-A:test")
     (cider-clojure-cli-global-options . "-A:test")
     (cider-clojure-cli-global-options . "-A:env/test")
     (cider-default-cljs-repl . shadow)
     (cider-preferred-build-tool . shadow-cljs))))

(global-set-key (kbd "C-x \\") 'align-regexp)

(require 'transpose-frame)

;; Terrible hack to fix profile mode bug: https://github.com/bbatsov/projectile/issues/1183
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq projectile-mode-line
;;       '(:eval (format " Projectile[%s(%s)]"
;;                       (projectile-project-name))))

;; This reverts files automatically
;; (global-auto-revert-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (require 'epa)
;; (epa-file-enable)
;; Pin entry on minibuffer
;; (setq epa-pinentry-mode 'loopback)
;; (pinentry-start)
