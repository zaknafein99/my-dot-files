;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; load the packaged named xyz.
;; (load "xyz") ;; best not to include the ending “.el” or “.elc”

(setq org-src-window-setup 'current-window)
(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(defun config-i3()
  (interactive)
  (find-file "~/.config/i3/config"))
(global-set-key (kbd "C-c i") 'config-i3)

(defun config-bash()
  (interactive)
  (find-file "~/.bashrc"))
(global-set-key (kbd "C-c b") 'config-bash)

(when window-system (global-hl-line-mode))
(beacon-mode 1)

(use-package eyebrowse
  :ensure t)
(eyebrowse-mode t)

;; Make linums relative by default
;; (with-eval-after-load 'linum
;;   (linum-relative-toggle))

;; Make linums relative by default
(global-linum-mode nil)
(linum-relative-global-mode)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
