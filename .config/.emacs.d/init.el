;;; init.el --- Personal Emacs configuration
;;; Stanislav Teroff
;;; -*- lexical-binding: t; -*-

;; --------------------
;; UI / Appearance
;; --------------------

(load-theme 'tango-dark t)

(setq display-line-numbers-type 'relative)

(global-display-line-numbers-mode 1)

;; Disable line numbers where they don’t make sense
(dolist (hook '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                vterm-mode-hook
                ansi-term-mode-hook
                org-agenda-mode-hook
                org-mode-hook))
  (add-hook hook (lambda () (display-line-numbers-mode 0))))

;; --------------------
;; Org mode
;; --------------------

(require 'org)
(require 'org-capture)

;; Ensure org directory exists
(make-directory (expand-file-name "~/Documents/Orgmode/") t)

(setq
 ;; Core directories / files
 org-directory (expand-file-name "~/Documents/Orgmode/")

  ;; TODO workflow
 org-todo-keywords
 '((sequence
    "NEXT(n)"
    "TODO(t)"
    "WAITING(w)"
    "SOMEDAY(s)"
    "PROJECT(p)"
    "|"
    "DONE(d)"
    "CANCELED(c)"))

 ;; Tags (global)
 org-tag-alist
 '((:startgroup)
   ("PHONE" . ?p)
   ("COMPUTER" . ?c)
   ("GARAGE" . ?g)
   ("SHOPPING" . ?s)
   ("FAMILY" . ?f)
   ("URGENT" . ?u)
   (:endgroup))
 )

(message "Loaded personal Emacs configuration")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files "~/.emacs.d/.agenda_files")
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :level . 1)))
 '(org-refile-use-outline-path 'file))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
