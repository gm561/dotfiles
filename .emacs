;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")
;(setq elget-path plugin-path)

;load settings
(add-to-list 'load-path "~/.emacs.d/settings")

;(setq user-modules-path)
(add-to-list 'load-path "~/.emacs.d/plugins/")

;;; Themes & UI
;(setq user-themes-path "~/.emacs.d/themes/") ; here goes themes
;(add-to-list 'custom-theme-load-path user-themes-path)
;(load-theme 'zenburn t) ; set zenburn as theme

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(font-lock-constant-face ((t (:foreground "white"))))
;;  '(font-lock-function-name-face ((t (:foreground "wheat"))))
;;  '(font-lock-type-face ((t (:foreground "cornsilk"))))
;;  '(font-lock-variable-name-face ((t (:foreground "wheat")))))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(global-auto-revert-mode t)
(server-start)


(setq backup-directory-alist `(("." . "~/.saves")))

;; Theme settings
(require 'theme-settings)

;; Basic settings
(require 'basic-settings)

;; Custom settings
(require 'custom-settings)

;; Custom functions
(require 'custom-functions)

;; Python mode
(require 'python-settings)

;; C settings
(require 'c-settings)

;; Haskell settings
(require 'haskell-settings)




