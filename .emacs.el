(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH"))

(require 'ido)
(ido-mode t)

(projectile-global-mode)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" , "~/.emacs.d/autosave" t)))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-show-hidden-files t)

(menu-bar-mode -1)

(require 'powerline)
(powerline-default-theme)


;;Golang-specific hooks
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-f") 'gofmt)))

(add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-k") 'godoc)))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)


(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-auctex)
(require 'go-autocomplete)
(ac-config-default)
(setq ac-modes '(go-mode julia-mode latex-mode emacs-lisp-mode))

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq LaTeX-item-indent 0)
(setq LaTeX-indent-level 2)

(load-theme 'zenburn t)

