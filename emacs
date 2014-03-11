(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/personal/org/home.org"
			     "~/Dropbox/personal/org/work.org"))

(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d")
(require 'paredit)

; http://www.emacswiki.org/emacs/ParEdit
    (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
    (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
    (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
    (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(put 'erase-buffer 'disabled nil)

; www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(setq make-backup-files nil)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))
(setq ido-create-new-buffer 'always)

(define-key global-map (kbd "RET") 'newline-and-indent)

; http://stackoverflow.com/questions/14370438/how-can-i-prevent-the-cursor-from-jumping-when-i-close-parentheses-in-emacs
(show-paren-mode 1)
(setq blink-matching-delay 0.3)

; elisp to openwith different file extensions
(require 'openwith)
(setq openwith-associations
      '(
	("\\.gnucash\\'" "gnucash" (file))
	("\\.chm\\'" "xchm" (file))
	))
(openwith-mode t)


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