(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(when (member "Hack" (font-family-list))
  (add-to-list 'initial-frame-alist' (font . "Hack-9"))
  (add-to-list 'default-frame-alist' (font . "Hack-9"))
)

(add-to-list 'default-frame-alist' (fullscreen . maximized))

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
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
;(toggle-frame-fullscreen)

(require 'powerline)
(powerline-default-theme)


;;Golang-specific hooks
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-f") 'gofmt)))

(add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-k") 'godoc)))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
;(require 'go-flymake)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-auctex)
(require 'go-autocomplete)
(ac-config-default)
(setq ac-modes '(go-mode julia-mode latex-mode emacs-lisp-mode))

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(when (eq system-type 'gnu/linux)
  (pdf-tools-install)
  (setq TeX-view-program-selection '((output-pdf "pdf-tools")))
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
)

(setq LaTeX-item-indent 0)
(setq LaTeX-indent-level 2)

(load-theme 'base16-ocean-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
