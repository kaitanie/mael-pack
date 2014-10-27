;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; Merlin mode for OCaml
;;(add-to-list 'load-path "~/.live-packs/mael-pack/dev/ocaml-pack/builtin-merlin-mode/")
;;(require 'merlin)
;;(setq merlin-command "~/.opam/4.01.0/bin/ocamlmerlin")  ; needed only if ocamlmerlin not already in your PATH
;;(autoload 'merlin-mode "merlin" "Merlin mode" t)
;;(add-hook 'tuareg-mode-hook 'merlin-mode)
;;(add-hook 'caml-mode-hook 'merlin-mode)

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

;; Scala-mode2
(add-to-list 'load-path "~/.live-packs/mael-pack/dev/scala-pack/scala-mode2/")
(require 'scala-mode2)

(require 'haskell-mode)
(require 'haskell-session)

(defun my-haskell-mode-hook ()
   (haskell-indentation-mode -1) ;; turn off, just to be sure
   (haskell-indent-mode 1)       ;; turn on indent-mode

   (turn-on-haskell-simple-indent)

   ;; further customisations go here.  For example:
   (setq locale-coding-system 'utf-8 )
   (flyspell-prog-mode)  ;; spell-checking in comments and strings
   ;; etc.

   )

;;(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; ENSIME
;;(let* ((ensime-path "~/.live-packs/mael-pack/dev/scala-pack/ensime/")
;;       (ensime-elisp (concat ensime-path "/dist/elisp/"))
;;       (ensime-bin (concat ensime-path "/dist/bin/")))
;;(progn
;;  (setenv "PATH" (concat ensime-bin ":" (getenv "PATH")))
;;  (add-to-list 'load-path ensime-elisp)
;;  (require 'ensime)))
