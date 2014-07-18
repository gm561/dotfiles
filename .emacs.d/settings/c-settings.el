;; c++ / c clean ups
(defconst my-c-style
  '(
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

(require 'auto-complete-clang)
(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(provide 'c-settings)
