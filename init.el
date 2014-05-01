;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; Scala-mode2
(add-to-list 'load-path "~/.live-packs/mael-pack/dev/scala-pack/scala-mode2/")
(require 'scala-mode2)

(require 'haskell-mode)
(require 'haskell-session)

;; ENSIME
(let* ((ensime-path "~/.live-packs/mael-pack/dev/scala-pack/ensime/")
       (ensime-elisp (concat ensime-path "/dist/elisp/"))
       (ensime-bin (concat ensime-path "/dist/bin/")))
  (progn
    (setenv "PATH" (concat ensime-bin ":" (getenv "PATH")))
    (add-to-list 'load-path ensime-elisp)
    (require 'ensime)))
