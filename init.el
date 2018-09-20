;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen nil)
 '(package-selected-packages
   (quote
    (auto-complete dracula-theme sr-speedbar go-mode python sml-mode)))
 '(speedbar-show-unknown-files t)
 '(tab-stop-list (number-sequence 4 200 4))
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

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(infer-indentation-style)

(add-hook 'after-init-hook 'global-auto-complete-mode) ; use auto-complete in all buffers

(when (version<= "26.0.50" emacs-version ) ; toggle line numbers
  (global-display-line-numbers-mode))

;; start sr-speedbar
(sr-speedbar-open)

;; show hidden files in speedbar
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

;; load the dracula theme
(load-theme 'dracula t)

;; bind C-; to comment-region
(global-set-key (kbd "C-; C-;") 'comment-region)

;; bind C-x <up> to window left and C-x <down> to window right
(global-set-key (kbd "C-x <up>") 'windmove-left)
(global-set-key (kbd "C-x <down>") 'windmove-right)
