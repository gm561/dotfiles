; no startup screen
(setq inhibit-startup-screen t)

; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

; show line numbers on left
(global-linum-mode t)

; show line number on bottom bar
;(line-number-mode t)

; show column number on bottom bar
(column-number-mode t)

; no blinking cursor
(blink-cursor-mode -1)

; no toolbar
(tool-bar-mode -1)

; no scroll bar
(toggle-scroll-bar -1)

; no menu bar
(menu-bar-mode -1)

; show trailing whitespaces
(setq-default show-trailing-whitespace t)

; highlight the line with the cursor
(global-hl-line-mode 1)

(provide 'basic-settings)
