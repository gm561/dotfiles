;;; Global keybindings

; switch windows
(global-set-key [C-tab] 'next-multiframe-window)

;compile
(global-set-key [(f11)] 'compile)

(ido-mode t)
(setq ido-enable-flex-matching t)

(windmove-default-keybindings)
(evil-mode t)
(desktop-save-mode t)

;; Set standard indent in c to 4
(setq-default c-basic-offset 4)
(setq standard-indent 4)

(require 'yasnippet)
(yas-global-mode t)

(autoload 'dirtree "dirtree" "Add directory to tree view" t)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas-expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/insert-snippet 'yasnippet)

(setq yas/prompt-functions '(yas/ido-prompt
                             yas/completing-prompt))

(require 'google-this)
(google-this-mode 1)

; expand region
(require 'expand-region)
; now
(define-key evil-visual-state-map "+" 'er/expand-region)
(define-key evil-visual-state-map "-" 'er/contract-region)

;undo-tree mode
(require 'undo-tree)
(global-undo-tree-mode)

;magit
(require 'magit)

(provide 'custom-settings)
