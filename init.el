;;**********************************************************
;; Michael Claybaugh's emacs init file
;;**********************************************************
;; Section 1: melpa :: see https://github.com/melpa/melpa
;;**********************************************************

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit neotree markdown-mode gruvbox-theme rust-mode web-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;***********************************************************
;; Section 2: Customizations and keybindings
;;***********************************************************
;; Disable audible bell because reasons
(setq visible-bell 1)

;; Disable toolbar
(tool-bar-mode -1)

;; Colortheme
(load-theme 'gruvbox t)

;; Neo Tree
(global-set-key [f8] 'neotree-toggle)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; show-whitespace
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))

;; Keybindings
;; enable whitespace-mode
(global-set-key (kbd "<f7>") 'whitespace-mode)

;; delete line like 'dd' in vim
(global-set-key (kbd "C-d") 'kill-whole-line)
