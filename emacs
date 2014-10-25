(setq org-directory "~/Org")
(setq org-default-notes-file (concat org-directory "/todo.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/todo.org") "Tasks")
             "** TODO %?\n")
        ("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
             "** TODO %?\n")))

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/Org/todo.org"))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

; Toggle the grid lines shown for the timestamps.
(setq org-agenda-use-time-grid nil)
(setq org-agenda-include-all-todo nil)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-time-grid nil)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-show-all-dates t)
(setq org-reverse-note-order t)

; http://gregorygrubbs.com/emacs/10-tips-emacs-windows/
(setq shell-file-name "bash")
(setq explicit-shell-file-name shell-file-name)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/bin/emacs-24.3-bin-i386/emacs-24.3/share/emacs/site-lisp/w3m")
(require 'w3m-load)
(require 'powershell)

;;(require 'mime-w3m)

(winner-mode t)
(require 'ido)
(ido-mode t)

(require 'synonyms)

;; move the backups to a separate directory
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))


; (require 'org-install)
; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
; (define-key global-map "\C-cl" 'org-store-link)
; (define-key global-map "\C-ca" 'org-agenda)
; (setq org-log-done t)
; (setq org-agenda-files (list "~/Dropbox/personal/org/home.org"
			     ; "~/Dropbox/personal/org/work.org"))

(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")
; (require 'paredit)

; http://www.emacswiki.org/emacs/ParEdit
; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
; (put 'erase-buffer 'disabled nil)

; www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
; (setq make-backup-files nil)
; (ido-mode 1)
; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)
; (setq ido-use-filename-at-point 'guess)
; 
; (fset 'yes-or-no-p 'y-or-n-p)
; (setq confirm-nonexistent-file-or-buffer nil)
; (setq inhibit-startup-message t
      ; inhibit-startup-echo-area-message t)
; 
; (setq kill-buffer-query-functions
  ; (remq 'process-kill-buffer-query-function
         ; kill-buffer-query-functions))
; (setq ido-create-new-buffer 'always)
; 
; (define-key global-map (kbd "RET") 'newline-and-indent)
; 
; ; http://stackoverflow.com/questions/14370438/how-can-i-prevent-the-cursor-from-jumping-when-i-close-parentheses-in-emacs
; (show-paren-mode 1)
; (setq blink-matching-delay 0.3)
; 
; elisp to openwith different file extensions
; (require 'openwith)
; (setq openwith-associations
      ; '(
	; ("\\.gnucash\\'" "gnucash" (file))
	; ("\\.chm\\'" "xchm" (file))
	; ))
; (openwith-mode t)


; adding aricent holidays
(setq holiday-local-holidays '(
			       (holiday-fixed 1  1  "New Year Day")
			       (holiday-fixed 3  17 "Holi")
			       (holiday-fixed 4  18 "Good Friday")
			       (holiday-fixed 7  29 "Ramzan/Id ul Fitr")
			       (holiday-fixed 8  15 "Independence Day*")
			       (holiday-fixed 10 2  "Gandhi Jayanthi *")
			       (holiday-fixed 10 23 "Deepavali - North")
			       (holiday-fixed 10 24 "Next day of Deepawali")
			       (holiday-fixed 12 25 "Christmas")
			       ))

; http://www.hakank.org/emacs/
(defun strip-html ()
        (interactive)
        (goto-char 1)  
        (replace-string "&lt;" "<")
        (goto-char 1)  
        (replace-string "&gt;" ">")
        (goto-char 1)  
        (replace-string "&amp;" "&")
        (goto-char 1)  
        (replace-string "&quot;" "\"")
        (goto-char 1)  
        (replace-regexp "</*B>" "")
)

; http://stackoverflow.com/questions/8524490/emacs-as-finder-explorer-copy-files
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Operating-on-Files.html
; Use other dired buffer displayed in next window as the destination directory for copy/move commands.
(setq dired-dwim-target t)

;; ability to revert split pane config. Call winner-undo C-c + left-arrow winner-redo C-c + right-arrow
;; http://ergoemacs.org/emacs/emacs_winner_mode.html
(winner-mode 1) ; in GNU emacs 23.2

;; http://www.emacswiki.org/emacs/emacs-w3m#toc15
(require 'w3m-e21)
(provide 'w3m-e23)
;; http://emacs-w3m.namazu.org/
(require 'w3m-load)
;; (require 'mime-w3m)


;; http://www.juanrubio.me/2011/11/emacs-smex-m-x-do-not-like-typing/
;; Does not work with my Emacs 23.4.1
;; Smex
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(defun w3m-open-current-page-in-firefox ()
  "Open the current URL in Mozilla Firefox."
  (interactive)
  (browse-url-firefox w3m-current-url))

(defun w3m-open-link-or-image-in-firefox ()
  "Open the current link or image in Firefox."
  (interactive)
  (browse-url-firefox (or (w3m-anchor) 
                          (w3m-image))))


;; save windows to a register.
;; C-x r w
;; C-x r j
;;C-x r w  stores the current configuration in a register
;;C-x r j  restores the configuration from a register

;; http://stackoverflow.com/questions/4477376/some-emacs-desktop-save-questions-how-to-change-it-to-save-in-emacs-d-emacs
(require 'desktop)
(setq desktop-dirname             "~/.emacs.d/desktop/"                                                                                            
      desktop-base-file-name      "emacs.desktop"                                                                                                  
      desktop-base-lock-name      "lock"                                                                                                           
      desktop-path                (list desktop-dirname)                                                                                           
      desktop-save                t                                                                                                                
      desktop-files-not-to-save   "^$" ;reload tramp paths                                                                                         
      desktop-load-locked-desktop nil)                                                                                                             
(desktop-save-mode 0)                                                                                                                              
 (defun my-desktop ()                                                                                                                               
   "Load the desktop and enable autosaving"                                                                                                         
   (interactive)                                                                                                                                    
   (let ((desktop-load-locked-desktop "ask"))                                                                                                       
     (desktop-read)                                                                                                                                 
     (desktop-save-mode 1)))

;; http://stackoverflow.com/questions/803812/emacs-reopen-buffers-from-last-session-on-startup
;; (let ((profile                                                                                                                                          
;;        (read-from-minibuffer "Choose a profile (acad,dist,lisp,comp,rpg,sqlg,ssqlfs,tl,tc,fpu): ")                                                      
;;        ))                                                                                                                                               
;;   (cond                                                                                                                                                 
;;    ((string-match "acad" profile)                                                                                                                       
;;     (dired "/home/thomp/academic")                                                                                                                      
;;     (dired "/home/thomp/academic/papers")                                                                                                               
;;     )                                                                                                                                                   
;;    ((string-match "lisp" profile)                                                                                                                       
;;     (setup-slime)                                                                                                                                       
;;     (lisp-miscellany)                                                                                                                                   
;;     (open-lisp-dirs)                                                                                                                                    
;;     )                                                                                                                                                   
;;    ((string-match "rpg" profile)                                                                                                                        
;;     (find-file "/home/thomp/computing/lisp/rp-geneval/rp-geneval/rp-geneval.lisp")                                                                      
;;     (dired "/home/thomp/computing/lisp/rp-geneval/rp-geneval")                                                                                          
;;     (dired "/home/thomp/academic/)))


(defun my-profile ()
       "Loads my sicp profile"
       (interactive)
       (w3m)
       (find-file "/home/jay/git/mine/config/emacs")
       (find-file "/home/jay/work/scheme/test.ss")
       (find-file "/home/jay/cm/books/scheme/sicp.pdf")
)

;;(defun swap-words (left right)
;;  " Swap (left right) with (right left)"
;;  (interactive "*sFirst Swap Word: \nsSecond Swap Word: ")
;;  (let ((left (regexp-quote left))
;;	(right (regexp-quote right)))
;;    (query-replace-regex
;;     (format "%s\\|%s" left right)
;;     (format "\,if (equal %s \&) %s %s" right left right))))

;; http://stackoverflow.com/questions/768243/interactive-emacs-lisp-function-to-swap-two-words-with-each-other
(defun swap-words (a b)
  "Replace all occurances of a with b and vice versa"
  (interactive "*sFirst Swap Word: \nsSecond Swap Word: ")
  (save-excursion
    (while (re-search-forward (concat (regexp-quote a) "\\|" (regexp-quote b)))
      (if (y-or-n-p "Swap?") 
      (if (equal (match-string 0) a)
          (replace-match (regexp-quote b))
        (replace-match (regexp-quote a))))
      )))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(doc-view-continuous t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(require 'calc)




(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; You don't need this one if you prefer marmalade and released versions:
;; (add-to-list 'package-archives
;;  '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


   (defun join-region (beg end)
     "Apply join-line over region."
     (interactive "r")
     (if mark-active
	     (let ((beg (region-beginning))
			   (end (copy-marker (region-end))))
		   (goto-char beg)
				   (while (< (point) end)
		     (join-line 1)))))


(set-default 'truncate-lines t)


; http://www.emacswiki.org/emacs/DeletingWhitespace

    (defun whack-whitespace (arg)
      "Delete all white space from point to the next word.  With prefix ARG
    delete across newlines as well.  The only danger in this is that you
    don't have to actually be at the end of a word to make it work.  It
    skips over to the next whitespace and then whacks it all to the next
    word."
      (interactive "P")
      (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
        (re-search-forward regexp nil t)
        (replace-match "" nil nil)))


; Repetition: http://stackoverflow.com/questions/275842/is-there-a-repeat-last-command-in-emacs
; M-x command-history followed by x to executed a command.
; Using repeat.el C-x z. Repetition can be repeated by using z key.

(require 'repeat)

(set-variable (quote scheme-program-name) "mzscheme")
