(load-file "~/.private.el")

(setq circe-reduce-lurker-spam t)

(setq circe-network-options
      `(("Freenode"
         :nick "amackera"
         :nickserv-password "Swordfish1"
         :channels (:after-auth "#emacs" "#emacs-circe"))))
