;;; web-init.el
;;; Web Development Initialization
(use-package js2-mode
  :ensure t)
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
