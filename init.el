;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes
   '("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default))
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "  ")
 '(git-gutter:window-width 2)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen nil)
 '(package-selected-packages
   '(exec-path-from-shell flycheck git-gutter yasnippet auto-complete sr-speedbar go-mode))
 '(setq display-line-numbers t)
 '(speedbar-show-unknown-files t)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;; enable using the mouse
(xterm-mouse-mode 1)
;; enable mouse scrolling
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)


;; deactivate the delay before showing matching parenthesis
(setq show-paren-delay 0)
;; show matching parenthesis
(show-paren-mode 1)
;; show the line matching the parenthesis in the mini-buffer
(defvar match-paren--idle-timer nil)
(defvar match-paren--delay 0.25)
(setq match-paren--idle-timer
    (run-with-idle-timer match-paren--delay t #'blink-matching-open))
;; auto-insert matching parenthesis
(electric-pair-mode 1)


(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))
(infer-indentation-style)


;; start autocomplete
(ac-config-default)
;; use auto-complete in all buffers
(add-hook 'after-init-hook 'global-auto-complete-mode)


;; start sr-speedbar
(sr-speedbar-open)
;; show hidden files in speedbar
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")


;; use git gutter mode
(require 'git-gutter)
;; If you enable global minor mode
(global-git-gutter-mode +1)
(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)
;; background color
(set-face-background 'git-gutter:modified "purple")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")


;; automatically use revert mode
(global-auto-revert-mode 1)

;; turn on flycheck mode for syntax highlighting
(global-flycheck-mode)
(exec-path-from-shell-initialize)

