;;; Global keybindings

; switch windows
(global-set-key [C-tab] 'next-multiframe-window) 

; eclipse-like line killing
;(global-set-key (kbd "C-M-d") 'kill-whole-line) 

;recompile
;(global-set-key [(f12)] 'compile)

;compile
(global-set-key [(f11)] 'compile) 

(ido-mode t)
(windmove-default-keybindings)
(evil-mode t)
(desktop-save-mode t)

;; Set standard indent in c to 4
(setq-default c-basic-offset 4)
(setq standard-indent 4)

(require 'yasnippet)
(yas-global-mode t)

(autoload 'dirtree "dirtree" "Add directory to tree view" t)

(provide 'custom-settings)
