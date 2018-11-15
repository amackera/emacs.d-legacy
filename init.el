
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
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

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-ruby.el")
(load "setup-rails.el")
(load "setup-python.el")
(load "setup-yaml.el")
(load "setup-org.el")
(load "setup-evil.el")

;; Revert all buffers
(load "revbufs.el")

;; Load Circe (IRC) config
(load "setup-circe.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(coffee-tab-width 4)
 '(cperl-indent-parens-as-block t t)
 '(custom-safe-themes
   (quote
    ("3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "6f08cb17c292b5a5dcccc3372dd38b4c1ec5a50cc0fa33e4a81ed7fbdb416cdc" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "3a3917dbcc6571ef3942c2bf4c4240f70b5c4bc0b28192be6d3f9acd83607a24" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(package-selected-packages
   (quote
    (evil-org evil-collection evil ## doom py-yapf ein circe rjsx-mode markdown-mode markdown-mode+ json-mode scss-mode all-the-icons async clojure-mode dash git-commit ido-completing-read+ ivy magit-popup package-build pyvenv s with-editor yasnippet prettier-js dockerfile-mode yaml-mode company zenburn-theme virtualenvwrapper monokai-theme doom-themes smooth-scrolling flyspell-correct elpy flycheck org aurora-config-mode web-mode js2-mode tt-mode multi-web-mode jsx-mode base16-theme tagedit smex rainbow-delimiters projectile paredit magit ido-ubiquitous exec-path-from-shell clojure-mode-extra-font-locking cider))))

(global-set-key (kbd "C-x \\") 'align-regexp)

(require 'transpose-frame)


;; Terrible hack to fix profile mode bug: https://github.com/bbatsov/projectile/issues/1183
(add-hook 'after-init-hook 'global-company-mode)
(setq projectile-mode-line
      '(:eval (format " Projectile[%s(%s)]"
                      (projectile-project-name))))

;; FLX for ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; ;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program 'browse-url-default-macosx-browser)
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

(global-git-commit-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq gud-pdb-command-name "python -m pdb")

;; This reverts files automatically
(global-auto-revert-mode t)

;; Silly function to copy without linebreaks (useful in ord mode where I fill all paragraphs)
(defun my-copy-simple (beg end)
  "Save the current region to the kill ring after stripping extra whitespace and new lines"
  (interactive "r")
  (copy-region-as-kill beg end)
  (with-temp-buffer
    (yank)
    (goto-char 0)
    (while (looking-at "[ \t\n]")
      (delete-char 1))
    (compact-uncompact-block)
    (mark-whole-buffer)
    (kill-region (point-min) (point-max))))

(defun compact-uncompact-block ()
  "Remove or add line ending chars on current paragraph.
This command is similar to a toggle of `fill-paragraph'.
When there is a text selection, act on the region."
  (interactive)

  ;; This command symbol has a property “'stateIsCompact-p”.
  (let (currentStateIsCompact (bigFillColumnVal 4333999) (deactivate-mark nil))

    (save-excursion
      ;; Determine whether the text is currently compact.
      (setq currentStateIsCompact
            (if (eq last-command this-command)
                (get this-command 'stateIsCompact-p)
              (if (> (- (line-end-position) (line-beginning-position)) fill-column) t nil) ) )

      (if (region-active-p)
          (if currentStateIsCompact
              (fill-region (region-beginning) (region-end))
            (let ((fill-column bigFillColumnVal))
              (fill-region (region-beginning) (region-end))) )
        (if currentStateIsCompact
            (fill-paragraph nil)
          (let ((fill-column bigFillColumnVal))
            (fill-paragraph nil)) ) )

      (put this-command 'stateIsCompact-p (if currentStateIsCompact nil t)) ) ) )
