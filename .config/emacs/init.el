;;; init.el --- Personal Emacs configuration
;;; -*- lexical-binding: t; -*-

;; --------------------
;; UI / Appearance
;; --------------------

(load-theme 'tango-dark t)

(setq display-line-numbers-type 'relative)

(global-display-line-numbers-mode 1)
(show-paren-mode 1)
(display-time)

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
(make-directory (expand-file-name "~/org") t)

(setq
 ;; Core directories / files
 org-directory (expand-file-name "~/org")
 org-default-notes-file (expand-file-name "inbox.org" org-directory)

 ;; Agenda files
 org-agenda-files
 (list (expand-file-name "inbox.org" org-directory)
       (expand-file-name "repeat.org" org-directory)
       (expand-file-name "someday.org" org-directory)
       (expand-file-name "mylife.org" org-directory))

 ;; TODO workflow (moved from mylife.org)
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

 ;; Refile (Inbox → others)
 org-refile-targets '((org-agenda-files :maxlevel . 3))
 org-refile-use-outline-path 'file
 org-outline-path-complete-in-steps nil
 org-refile-allow-creating-parent-nodes nil

 ;; Archive location
 org-archive-location
 (concat (expand-file-name "archive.org" org-directory)
         "::datetree/"))

;; --------------------
;; Capture templates
;; --------------------

(setq org-capture-templates
      `(("i" "Inbox task" entry
         (file ,(expand-file-name "inbox.org" org-directory))
         "* TODO %?\n  %U\n"
         :empty-lines 1)

        ("r" "Repeating task" entry
         (file ,(expand-file-name "repeat.org" org-directory))
         "* TODO %?\n  SCHEDULED: %^t\n  %U\n"
         :empty-lines 1)

        ("s" "Someday / Maybe" entry
         (file ,(expand-file-name "someday.org" org-directory))
         "* SOMEDAY %?\n  %U\n"
         :empty-lines 1)))

;; --------------------
;; Keybindings
;; --------------------

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "<f6>")  #'org-capture)
(global-set-key (kbd "<f7>")  #'org-refile)

;; Auto-save after refiling
(advice-add 'org-refile :after
            (lambda (&rest _) (org-save-all-org-buffers)))

(message "Loaded personal Emacs configuration")
