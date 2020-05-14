(require 'package)
(setq package-enable-at-startup nil) ; dont do it immediately
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
             ("gnu"       . "http://elpa.gnu.org/packages/")
             ("melpa"     . "https://melpa.org/packages/")))
(package-initialize);;package manager

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ; update archives
  (package-install 'use-package)) ; grab the newest use-package

;; Define packages
(require 'use-package)

;; Always download if not available
(setq use-package-always-ensure t)

(use-package all-the-icons)
;;initial configs
(setq delete-old-versions -1 ) ; delete excess backups silently
(setq version-control t )
(setq vc-make-backup-files t )
(setq vc-follow-symlinks t )
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) )
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) )
(setq inhibit-startup-screen t )
(setq ring-bell-function 'ignore ) ; silent bell on mistakes
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)
(setq-default fill-column 80) ; toggle wrapping text at this column
(setq initial-scratch-message "Hi Akshit. C-x C-f eh" ) ; You should probably change this
(menu-bar-mode -1) ; no need for the menu bars - we've got key combos for that!
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(load-theme 'monokai t)





;; Use font lock mode
(global-font-lock-mode t)

;; Highlight cursor line
;; Highlight selected region
(transient-mark-mode t)




(package-initialize)
(require 'auto-complete)
(ac-config-default)
(global-auto-complete-mode t)
(add-hook 'after-init-hook 'global-company-mode)
(ivy-mode 1)
(scroll-bar-mode -1)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(show-paren-mode 1)
(electric-pair-mode 1)

(require 'init-neotree)
(require 'init-ivy)
(require 'init-flycheck)
(require 'init-company)
(require 'init-which-key)
(use-package find-file-in-project)

(global-set-key (kbd "C-c h") 'company-complete)


(require 'init-rjsx)

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;Use space instead of tab
            (setq js-indent-level 2) ;;space width is 2 (default is 4)
            (setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning

(require 'company)

                           
;; Disable completion keybindings, as we use
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-journal org-journal-list php-mode eldoc-box treemacs-projectile emacs-neotree evil elcord react-snippets projectile tern-auto-complete prettier-js company-tern which-key web-mode use-package tide smartparens rjsx-mode reason-mode ocp-indent neotree monokai-theme forth-mode find-file-in-project company auto-complete all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(require 'elcord)
(elcord-mode)
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)


(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(windmove-default-keybindings)

;; Use rjsx-mode for js files
(add-to-list 'auto-mode-alist '("\\.js\\'"    . rjsx-mode))
;; Tide setup
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
;;  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(setq tide-completion-ignore-case t)
;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'js2-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)
(setq tide-format-options
      '(:indentSize 2 :tabSize 2))

(require 'clean)
(provide 'init)
;;; init.el ends here 
