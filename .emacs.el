(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(require 'ido)
(ido-mode t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" , "~/.emacs.d/autosave" t)))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-show-hidden-files t)

(menu-bar-mode -1)

(require 'powerline)
(powerline-default-theme)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-auctex)
(ac-config-default)

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq LaTeX-item-indent 0)
(setq LaTeX-indent-level 2)

(load-theme 'zenburn t)

