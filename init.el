
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

;; ==========================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(custom-safe-themes
   '("cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "6f08cb17c292b5a5dcccc3372dd38b4c1ec5a50cc0fa33e4a81ed7fbdb416cdc" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "3a3917dbcc6571ef3942c2bf4c4240f70b5c4bc0b28192be6d3f9acd83607a24" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults))
 '(elpy-test-runner 'elpy-test-pytest-runner)
 '(package-selected-packages
   '(pyenv-mode prettier tide typescript-mode realgud npm-mode jedi pytest direnv use-package pipenv graphql-mode jupyter ample-theme pdf-tools auto-complete cask deferred epl f find-file-in-project flx flx-ido ghub goto-chg highlight-indentation hlinum json-reformat json-snatcher memoize pallet pkg-info popup request request-deferred shut-up simple-httpd skewer-mode transpose-frame websocket evil-org evil-collection evil ## doom py-yapf ein circe rjsx-mode markdown-mode markdown-mode+ json-mode scss-mode all-the-icons async clojure-mode dash git-commit ido-completing-read+ ivy magit-popup package-build pyvenv s with-editor yasnippet prettier-js dockerfile-mode yaml-mode company zenburn-theme virtualenvwrapper monokai-theme doom-themes smooth-scrolling flyspell-correct elpy flycheck org aurora-config-mode web-mode js2-mode tt-mode multi-web-mode jsx-mode base16-theme tagedit smex rainbow-delimiters projectile paredit magit ido-ubiquitous exec-path-from-shell clojure-mode-extra-font-locking cider))
 '(safe-local-variable-values
   '((cider-clojure-cli-global-options . "-A:env/test")
     (cider-clojure-cli-global-options . "-M:test"))))

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
