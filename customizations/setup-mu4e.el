(require 'mu4e)

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

(setq mu4e-maildir "~/mail")
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

(setq )

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
;; (setq
;;    user-mail-address "anson@ada.support"
;;    user-full-name  "Anson MacKeracher"
;;    mu4e-compose-signature
;;     (concat
;;      "Anson MacKeracher\n"
;;      "Head of Engineering\n"
;;      "https://ada.support\n"))
(setq mu4e-compose-dont-reply-to-self t)
(setq mu4e-user-mail-address-list '("anson@ada.support" "amackera@gmail.com"))
(setq mu4e-compose-signature-auto-include t)

;; Sending mail
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-smtp-service 587)

;; ;; alternatively, for emacs-24 you can usep:
;; (setq message-send-mail-function 'async-smtpmail-send-it
;;     smtpmail-stream-type 'starttls
;;     smtpmail-default-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-service 587)

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
;; Prefer text/plain over HTML
(setq mu4e-view-html-plaintext-ratio-heuristic most-positive-fixnum)

(setq mu4e-contexts
    `( ,(make-mu4e-context
	  :name "Personal"
	  :enter-func (lambda () (mu4e-message "Entering Personal context"))
          :leave-func (lambda () (mu4e-message "Leaving Personal context"))
	  :match-func (lambda (msg)
			(when msg
			  (mu4e-message-contact-field-matches msg
			    :to "amackera@gmail.com")))
	  :vars '( (user-mail-address	    . "amackera@gmail.com"  )
		   (user-full-name	    . "Anson MacKeracher" )
		   (mu4e-compose-signature .
		     (concat
		       "Anson MacKeracher\n"
		       "Toronto, Canada\n"))
                   (mu4e-drafts-folder . "/personal/personal.drafts")
                   (mu4e-sent-folder   . "/personal/personal.sent")
                   (mu4e-trash-folder  . "/personal/personal.trash")
                   (mu4e-refile-folder . "/personal/personal.archive")
                   (user-mail-address . "amackera@gmail.com")
                   (smtpmail-default-smtp-server . "smtp.gmail.com")
                   (smtpmail-smtp-server . "smtp.gmail.com")
                   (smtpmail-auth-credentials . '(("smtp.gmail.com" 587 "amackera@gmail.com" nil)))
                   (smtpmail-starttls-credentials . '(("smtp.gmail.com" 587 nil nil)))
                   (mu4e-maildir-shortcuts . ( ("/personal/inbox" . ?i)
                                               ("/personal/personal.sent" . ?s)))))
       ,(make-mu4e-context
	  :name "Work"
	  :enter-func (lambda () (mu4e-message "Switch to the Work context"))
          :match-func (lambda (msg)
			(when msg
			  (mu4e-message-contact-field-matches msg
			    :to "anson@ada.support")))
	  :vars '( (user-mail-address	     . "anson@ada.support" )
		   (user-full-name	     . "Anson MacKeracher" )
		   (mu4e-compose-signature  .
		     (concat
		       "Anson MacKeracher\n"
		       "Head of Engineering at Ada\n"))
                   (mu4e-drafts-folder . "/ada/ada.drafts")
                   (mu4e-sent-folder   . "/ada/ada.sent")
                   (mu4e-trash-folder  . "/ada/ada.trash")
                   (mu4e-refile-folder . "/ada/ada.archive")
                   (user-mail-address . "anson@ada.support")
                   (smtpmail-default-smtp-server . "smtp.gmail2.com")
                   (smtpmail-smtp-server . "smtp.gmail2.com")
                   (smtpmail-auth-credentials . '(("smtp.gmail2.com" 587 "anson@ada.support" nil)))
                   (smtpmail-starttls-credentials . '(("smtp.gmail2.com" 587 nil nil)))
                   (mu4e-maildir-shortcuts . ( ("/ada/inbox" . ?i)
                                               ("/ada/ada.sent" . ?s)))))))
