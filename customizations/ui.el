;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; Show line numbers
;;(global-display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Highlight current line
(global-hl-line-mode nil)

;; Highlight current line number
(hlinum-activate)

;; Remove graphical toolbar, menubar and scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.

;; Brighten up monokai comment color
(setq monokai-comments "#919191")
;; (load-theme 'monokai t)
(load-theme 'gruvbox-dark-soft t)
;(load-theme 'base16-eighties)


;; DOOM Theme
;;; Settings (defaults)
;; (setq doom-enable-bold t    ; if nil, bolding are universally disabled
      ;; doom-enable-italic t  ; if nil, italics are universally disabled

      ;; doom-one specific settings
      ;; doom-one-brighter-modeline nil
      ;; doom-one-brighter-comments nil
;)
;; brighter minibuffer when active
;; (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)
;; Enable nlinum line highlighting
;; (require 'doom-nlinum)     ; requires nlinum and hl-line-mode


;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (add-to-list 'load-path "~/.emacs.d/themes")
;; (load-theme 'base16-eighties t)
;; (load-theme 'tomorrow-night-bright t)
;; (load-theme 'atom-one-dark t)

;; Set fonts yay
;(set-face-attribute 'default nil :font "Ubuntu Mono-9")

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)
(setq-default left-fringe-width  10)

;; black magic taken from https://emacs.stackexchange.com/a/338/15177
(add-to-list 'display-buffer-alist
         '("^\\*compilation\\*". ((display-buffer-reuse-window)  .
                                  ((reusable-frames . t)
                                  (inhibit-same-window . t)))))

;; Better window movement
(windmove-default-keybindings)
