;;; aurora-config-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "aurora-config-mode" "aurora-config-mode.el"
;;;;;;  (22324 58407 986602 736000))
;;; Generated autoloads from aurora-config-mode.el

(add-to-list 'auto-mode-alist '("\\.aurora\\'" . aurora-config-mode))

(add-to-list 'auto-mode-alist '("\\.mesos\\'" . aurora-config-mode))

(autoload 'aurora-config-inspect "aurora-config-mode" "\
Run `aurora inspect JOBPATH' with the config in current buffer.

\(fn JOBPATH)" t nil)

(autoload 'aurora-config-diff "aurora-config-mode" "\
Run `aurora diff JOBPATH' with the config in current buffer.

\(fn JOBPATH)" t nil)

(autoload 'aurora-config-mode "aurora-config-mode" "\
Major mode for Aurora configuration files, derived from Python mode.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; aurora-config-mode-autoloads.el ends here
