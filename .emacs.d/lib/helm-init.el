;;; helm-init.el
;;; Helm Initialization
(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  :bind ("M-x" . helm-M-x))
(use-package helm-projectile
  :ensure t
  :bind ("C-x e" . helm-projectile-find-file))
(use-package helm-ag
  :ensure t
  :bind ("C-x g" . helm-projectile-ag))
