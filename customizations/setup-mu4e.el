(require 'mu4e)



;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; default
;; (setq mu4e-maildir "~/Maildir")

(setq mu4e-maildir "~/mail")
(setq mu4e-drafts-folder "/ada.drafts")
(setq mu4e-sent-folder   "/ada.sent")
(setq mu4e-trash-folder  "/ada.trash")
(setq mu4e-refile-folder "/ada.archive")
(setq mu4e-attachment-dir  "~/Downloads")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; (See the documentation for `mu4e-sent-messages-behavior' if you have
;; additional non-Gmail addresses and want assign them different
;; behavior.)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
    '( ("/inbox"               . ?i)
       ("/ada.sent"   . ?s)
       ("/ada.trash"       . ?t)
       ("/ada.archive"    . ?a)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
   user-mail-address "anson@ada.support"
   user-full-name  "Anson MacKeracher"
   mu4e-compose-signature
    (concat
     "Anson MacKeracher\n"
     "Head of Engineering\n"
     "https://ada.support\n"))
(setq mu4e-compose-dont-reply-to-self t)
(setq mu4e-user-mail-address-list '("anson@ada.support"))
;;(setq mu4e-compose-signature-auto-include t)

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

;; (require 'smtpmail)
;; (setq message-send-mail-function 'smtpmail-send-it
;;    starttls-use-gnutls t
;;    smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;    smtpmail-auth-credentials
;;      '(("smtp.gmail.com" 587 "anson@ada.support" nil))
;;    smtpmail-default-smtp-server "smtp.gmail.com"
;;    smtpmail-smtp-server "smtp.gmail.com"
;;    smtpmail-smtp-service 587)

(require 'smtpmail-async)

;; alternatively, for emacs-24 you can use:
(setq message-send-mail-function 'async-smtpmail-send-it
    smtpmail-stream-type 'starttls
    smtpmail-default-smtp-server "smtp.gmail.com"
    smtpmail-smtp-server "smtp.gmail.com"
    smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; Better HTML rendering?
;;(setq mu4e-html2text-command "html2text")

(add-hook 'mu4e-compose-mode-hook
  (defun my-do-compose-stuff ()
    "My settings for message composition."
    (flyspell-mode)))


;; Make messages more readble in dark mode
(setq shr-color-visible-luminance-min 80)
