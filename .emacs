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
