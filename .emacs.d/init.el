(require 'package)
(add-to-list 'package-archives
	                  '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
      (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lib"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(load "ruby-init")
(load "web-init")
(load "helm-init")
;; (load "ivy-init")
(load "magit-init")

;;; EViL and Vim-related
(use-package evil
  :ensure t
  :config
  (add-to-list 'evil-insert-state-modes 'dashboard-mode)
  (evil-mode 1))
(use-package ranger
  :ensure t)
(use-package neotree
  :ensure t
  :bind ([f8] . neotree-toggle))

;;; Company
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode t)
  (push 'company-robe company-backends)
  (push 'company-anaconda company-backends))

;;; Yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (yas-global-mode 1))


(use-package projectile
  :ensure t
  :config (projectile-mode))

;;; Dashboard init
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "\"Praise the LORD. Give thanks to the LORD, for He is good; His love endures forever.\" Psalm 106:1")
  (setq dashboard-set-footer nil)
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

;;; Misc
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)
(global-set-key (kbd "C-x M-b") 'toggle-tool-bar-mode-from-frame)
(add-hook 'python-mode-hook 'anaconda-mode)
(use-package better-defaults :ensure t)
(setq custom-file "~/.emacs.d/custom.el")
(setq x-select-enable-primary t)
(setq inhibit-splash-screen t)
;; checks if EMACS is graphical
(if (display-graphic-p)
    (progn
      (push '(font . "Hack") default-frame-alist) ; Sets prefered font
      ;; (use-package zenburn-theme
      (use-package gruvbox-theme
	:ensure t
	:config
        (load-theme 'gruvbox t))
      (use-package powerline
        :ensure t
        :config
        (powerline-center-evil-theme)
        (setq powerline-arrow-shape 'arrow)))
    ;; else (In Terminal)
  (menu-bar-mode 0)
  (require 'linum)
  (global-linum-mode 1))
