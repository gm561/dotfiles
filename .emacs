:;;; Load list
(setq user-modules-path "~/.emacs.d/plugins/") ; here go additional modules
(add-to-list 'load-path user-modules-path)

;;; Themes & UI
(setq user-themes-path "~/.emacs.d/themes/") ; here goes themes
(add-to-list 'custom-theme-load-path user-themes-path)
(load-theme 'zenburn t) ; set zenburn as theme
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
;(set-default-font "Inconsolata-12")
;(setq default-frame-alist '((font .
;				  "-unknown-Inconsolata-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")))
; set font for graphical window (workaround for emacs --daemon); the value here is taken from (describe-font);
; Inconsolata font: http://levien.com/type/myfonts/inconsolata.html
(setq-default show-trailing-whitespace t) ; show trailing whitespaces

;; In every buffer, the line which contains the cursor will be fully highlighted
(global-hl-line-mode 1)

;; Set standard indent to 4
(setq standard-indent 4)

;;; Global keybindings
(global-set-key [C-tab] 'next-multiframe-window) ; switch windows
(global-set-key (kbd "C-M-d") 'kill-whole-line) ; eclipse-like line killing
(global-set-key [(f12)] 'compile) ;recompile
(global-set-key [(f11)] 'compile) ;compile

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(ido-mode t)
