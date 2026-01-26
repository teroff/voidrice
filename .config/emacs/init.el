; Theme
(load-theme 'tango-dark t)

; Lines
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)
(show-paren-mode 1)

; Clock
(display-time)

; Startup Windowing
(push '(fullscreen . maximized) default-frame-alist)
				      
; Orgmode
(require 'org)
(require 'org-capture)

(setq org-default-notes-file (expand-file-name "~/org/inbox.org"))

(setq org-capture-templates
      '(("t" "Task" entry
         (file org-default-notes-file)
         "* TODO %?\n  %U\n")))

(setq org-agenda-files '("~/org/mylife.org" "~/org/inbox.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "<f6>") 'org-capture)
