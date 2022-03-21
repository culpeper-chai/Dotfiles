;;; init/ruby.el
;;; Ruby Development Initialization

(use-package inf-ruby
  :ensure t
  :config
  (global-set-key (kbd "C-c r r") 'inf-ruby))
(use-package robe
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'robe-mode))
(use-package flymake-ruby
  :ensure t
  :config
  (require 'flymake-ruby)
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))
(use-package ruby-electric 
	:ensure t
	:config
	(add-hook 'ruby-mode-hook 'ruby-electric-mode))
