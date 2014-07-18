;------------------------;
;;; Python Programming ;;;
;------------------------;

;; -----------------------
;; python.el configuration
;; -----------------------

; from python.el
(require 'python)

(require 'epc)
(setq jedi:setup-keys t)
;(setq jedi:server-command '("python" "~/.emacs.d/elpa/jedi-20140321.1323/jediepcserver.py"))
(setq jedi:tooltip-method '(pos-tip))
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)

(provide 'python-settings)
