;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")
;(setq elget-path plugin-path)

;load settings
(add-to-list 'load-path "~/.emacs.d/settings")

;(setq user-modules-path)
(add-to-list 'load-path "~/.emacs.d/plugins/")

(setq backup-directory-alist `(("." . "~/.saves")))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(global-auto-revert-mode t)
(server-start)

;; Theme settings
(require 'theme-settings)

;; Basic settings
(require 'basic-settings)

;; Custom functions
(require 'custom-functions)

;; Custom settings
(require 'custom-settings)

;; Python mode
(require 'python-settings)

;; C settings
(require 'c-settings)

;; Haskell settings
(require 'haskell-settings)

;; Scheme mode
(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))

(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))

(autoload 'scheme-get-current-symbol-info "scheme-complete" nil t)
(add-hook 'scheme-mode-hook
  (lambda ()
    (make-local-variable 'eldoc-documentation-function)
    (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
    (eldoc-mode)))
(setq lisp-indent-function 'scheme-smart-indent-function)
