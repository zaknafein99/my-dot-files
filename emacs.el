
(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))

(ad-activate 'ansi-term)
(global-set-key (kbd "<s-return>") 'ansi-term)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(setq scroll-conservatively 100)

(setq ring-bell-function 'ignore)

(when window-system (global-prettify-symbols-mode t))

(when window-system (global-hl-line-mode t))

(tool-bar-mode -1)

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

;;(add-to-list 'load-path "~/.emacs.d/evil")
;;(require 'evil)
;;(evil-mode 1)

(require 'linum-relative)

(linum-on)
(linum-relative-mode)
(global-linum-mode t)

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert t)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(defun config-visit ()
  (interactive)
  (find-file "~/my-dot-files/emacs.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload()
  (interactive)
  (org-babel-load-file (expand-file-name "~/my-dot-files/emacs.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))