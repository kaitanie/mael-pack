;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;;(load-file "~/sw/emacs-modes/emacs-scrum/scrum.el")
(add-to-list 'load-path "~/sw/emacs-modes/scala-mode2/")
(require 'scala-mode2)

;; ENSIME
;;(add-to-list 'load-path "~/sw/emacs-modes/ensime/ensime_2.10.0-RC3-0.9.8.2/elisp/")
(add-to-list 'load-path "~/sw/ensime/dist/elisp/")
(require 'ensime)

(add-to-list 'load-path "~/sw/emacs-modes/emacs-scrum/")
(require 'scrum)

;; Erlang
(add-to-list 'load-path "~/sw/distel/elisp")
(require 'distel)
(distel-setup)

(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/tuareg/")

