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
    (auctex flycheck highlight-indent-guides magit neotree markdown-mode gruvbox-theme rust-mode web-mode))))
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

;; show matching paren without delay
(show-paren-mode 1)
(setq show-paren-delay 0)

;; no tabs
(setq-default indent-tabs-mode nil)
;;(setq tab-width 4)
(setq-default tab-width 4)

;; show-whitespace
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark)))

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; Keybindings
;; show line numbers
(global-set-key (kbd "<f6>") 'linum-mode)

;; enable whitespace-mode
(global-set-key (kbd "<f7>") 'whitespace-mode)

;; delete line like 'dd' in vim
(global-set-key (kbd "C-d") 'kill-whole-line)

;; Web mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-attr-indent-offset 0)

;; highlight-indent-guides
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;(setq highlight-indent-guides-method 'character)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

(provide 'init)
;;; init ends here
