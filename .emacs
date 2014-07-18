;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")
;(setq elget-path plugin-path)

;load settings
(add-to-list 'load-path "~/.emacs.d/settings")

:;;; Load list
;(setq user-modules-path)
(add-to-list 'load-path "~/.emacs.d/plugins/")

;;; Themes & UI
(setq user-themes-path "~/.emacs.d/themes/") ; here goes themes
(add-to-list 'custom-theme-load-path user-themes-path)
;(load-theme 'zenburn t) ; set zenburn as theme

(custom-set-faces

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "white"))))
 '(font-lock-function-name-face ((t (:foreground "wheat"))))
 '(font-lock-type-face ((t (:foreground "cornsilk"))))
 '(font-lock-variable-name-face ((t (:foreground "wheat")))))
(setq inhibit-startup-screen t) ; no startup screen
(setq scroll-margin 0 ; some nice scrolling
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(global-linum-mode t) ; show line numbers on left
(line-number-mode t) ; show line number on bottom bar
(column-number-mode t) ; show column number on bottom bar
(blink-cursor-mode -1) ; no blinking cursor

(tool-bar-mode -1) ; no toolbar
(toggle-scroll-bar -1) ; no scroll bar
(menu-bar-mode -1) ; no menu bar

(set-frame-font "Inconsolata-10" nil)
(setq-default show-trailing-whitespace t) ; show trailing whitespaces

;; In every buffer, the line which contains the cursor will be fully highlighted
(global-hl-line-mode 1)

;;; Global keybindings
(global-set-key [C-tab] 'next-multiframe-window) ; switch windows
(global-set-key (kbd "C-M-d") 'kill-whole-line) ; eclipse-like line killing
(global-set-key [(f12)] 'compile) ;recompile
(global-set-key [(f11)] 'compile) ;compile

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(ido-mode t)
(windmove-default-keybindings)
(evil-mode t)
(desktop-save-mode t)

(require 'yasnippet)
(yas-global-mode t)

;; (add-hook 'after-init-hook 'global-company-mode)
;; (require 'company)                                   ; load company mode
;; (setq company-tooltip-limit 20)                      ; bigger popup window
;; (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;; (setq company-echo-delay 0)                          ; remove annoying blinking
;; (setq company-begin-commands '(self-insert-command))

(require 'color)
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; Set standard indent to 4
(setq-default c-basic-offset 4)
(setq standard-indent 4)

;; c++ / c clean ups
(defconst my-c-style
  ;; Always indent c/c++ sources, never insert tabs
  '(
    ;; List of various C/C++/ObjC constructs to "clean up".
    (c-cleanup-list             . (
				   defun-close-semi
				   list-close-comma
				   scope-operator
				   one-liner-defun
;				   space-before-funcall
				   brace-else-brace
				   ))
	))

(c-add-style "my" my-c-style)
;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "my")
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline, but not hungry-delete
;  (c-toggle-auto-newline 1)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(global-auto-revert-mode t)
(server-start)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;ignore these files in completion
(add-to-list 'completion-ignored-extensions ".hi")

(require 'auto-complete-clang)
(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(setq backup-directory-alist `(("." . "~/.saves")))

;; Custom functions
(require 'custom-functions)

;; Python mode
(require 'python-settings)

(autoload 'dirtree "dirtree" "Add directory to tree view" t)

(load-theme 'solarized-dark t)

