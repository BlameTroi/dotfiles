;; troy's emacs configuration, inspired by many things i've
;; seen exploring, i don't remember where the ideas came from
;;
;; june 2021

;; package management
;; melpa to archives, enable
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(unless package-archive-contents
  (package-refresh-contents))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; some standard libraries
(require 'cl-lib)     ;; use the right cl libraries
(require 'seq)        ;; sequence operations

;; theming
(load-theme 'alect-black-alt t)

;; performance
(add-hook 'focus-out-hook 'garbage-collect)
(setq gc-cons-threshold 100000000)

;; i'm not a fan of trailing white space
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; a quieter system and startup
(setq-default visible-bell t)
(setq inhibit-startup-screen t)

;; don't use native dialogs, learn to stay in emacs
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; encoding, utf-8 everywhere
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)


(setq-default
  cursor-in-non-selected-windows nil ; makes sense to me
  fill-column 70            ; width for auto line wrap
  indent-tabs-mode nil      ; space it out
  initial-scratch-message ";;Troy's emacs --\n\tserver-shutdown brings down server\n"      ; the abyss isn't quite so empty
  select-enable-clipboard t ; this should integrate kill ring with system
)

(cd "e:/")
(display-time-mode 1)    ; display clock

(fset 'yes-or-no-p 'y-or-n-p)         ; less typing

;; i prefer case insensitive matching
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-name-completion-ignore-case t)

;; get the various custom-set-variable blocks out
;; of my init.el
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; ace-window for better window navigation
(use-package ace-window :ensure t)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
)

;; frequently used language modes

(use-package sml-mode :ensure t)

(use-package racket-mode :ensure t)
(setq racket-program "e:/bin/racket/racket.exe")

;;;;;;;;;;;;;;
;; ctags/etags
;; consider melpa ctags-update
;; C:\ProgramData\chocolatey\bin\ctags.exe
;;(setq path-to-ctags "c:/ProgramData/chocolatey/bin/ctags.exe")
;;(defun create-tags (dir-name)
;;  "Create tags file."
;;  (interactive "DDirectory: ")
;;  (shell-command
;;   (format "%s -f TAGS -e -R %s" "ctags" (directory-file-name dir-name)))
;;)
