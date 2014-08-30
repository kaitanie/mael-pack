;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; Merlin mode for OCaml
(add-to-list 'load-path "~/.live-packs/mael-pack/dev/ocaml-pack/builtin-merlin-mode/")
;;(require 'merlin)
(setq merlin-command "~/.opam/4.01.0/bin/ocamlmerlin")  ; needed only if ocamlmerlin not already in your PATH
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

;; Scala-mode2
(add-to-list 'load-path "~/.live-packs/mael-pack/dev/scala-pack/scala-mode2/")
(require 'scala-mode2)

(require 'haskell-mode)
(require 'haskell-session)

;; ENSIME
;;(let* ((ensime-path "~/.live-packs/mael-pack/dev/scala-pack/ensime/")
;;       (ensime-elisp (concat ensime-path "/dist/elisp/"))
;;       (ensime-bin (concat ensime-path "/dist/bin/")))
;;(progn
;;  (setenv "PATH" (concat ensime-bin ":" (getenv "PATH")))
;;  (add-to-list 'load-path ensime-elisp)
;;  (require 'ensime)))
