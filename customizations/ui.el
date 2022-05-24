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
(load-theme 'kaolin-galaxy t)
;;(load-theme 'base16-eighties)



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

;; Better window movement
(windmove-default-keybindings)

;; Split windows vertically instead of horizontally
(setq split-width-threshold 0)
(setq split-height-threshold nil)

(cond
 ((string-equal system-type "darwin")
  (progn
    (mac-auto-operator-composition-mode)
    (set-face-attribute 'default nil :font "Fira Code" :height 120 :weight 'normal)))
 ((string-equal system-type "gnu/linux")
  (progn
    (global-fira-code-mode)
    (setq x-super-keysym 'meta)
    (set-face-attribute 'default nil :font "Fira Code" :height 90 :weight 'semi-bold))))

;; Enable clickable links
(goto-address-mode)

(defun amackera/split-windows()
  "Split windows sasa's way."
  (interactive)
  ;; Create new window right of the current one
  ;; Current window is 80 characters (columns) wide
  (split-window-right 180)
  ;; Go to next window
  (other-window 1)
  ;; Create new window below current one
  (split-window-below)
  ;; Start eshell in current window
  (eshell)
  ;; Go to previous window
  (other-window -1)
  ;; never open any buffer in window with shell
  ;; (set-window-dedicated-p (nth 1 (window-list)) t)
  )

(defun amackera/display-buffer (buffer &optional alist)
  "Select window for BUFFER (need to use word ALIST on the first line).
Returns third visible window if there are three visible windows, nil otherwise.
Minibuffer is ignored."
  (let ((wnr (if (active-minibuffer-window) 3 2)))
    (when (= (+ wnr 1) (length (window-list)))
      (let ((window (nth wnr (window-list))))
        (set-window-buffer window buffer)
        window))))

(defvar amackera/help-temp-buffers '("^\\*Flycheck errors\\*$"
                                     "^\\*Completions\\*$"
                                     "^\\*Help\\*$"
                                     ;; Other buffers names...
                                     "^\\*cider-repl"
                                     "^\\*cider-error"
                                     "^\\*cider-test-report\\*"
                                     "^\\*Colors\\*$"
                                     "^magit:"
                                     "^\\*Async Shell Command\\*$"))

(while amackera/help-temp-buffers
  (add-to-list 'display-buffer-alist
               `(,(car amackera/help-temp-buffers)
                 (display-buffer-reuse-window
                  amackera/display-buffer
                  display-buffer-in-side-window)
                 (reusable-frames     . visible)
                 (side                . bottom)
                 (window-height       . 0.33)
                 ))
  (setq amackera/help-temp-buffers (cdr amackera/help-temp-buffers)))
