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

(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.0/../../../../include/c++/4.9.0
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.0/../../../../include/c++/4.9.0/x86_64-unknown-linux-gnu
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.0/../../../../include/c++/4.9.0/backward
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.0/include
/usr/local/include
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.0/include-fixed
/usr/include
"
	       )))

(global-auto-complete-mode t)
(require 'auto-complete-clang)
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(setq ac-use-fuzzy 1.5)
(ac-set-trigger-key "TAB")
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

;; (require 'member-function)
;; (setq mf--source-file-extension "cpp")

(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)


;add support for ggtags
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)
	      (local-set-key (kbd "M-p") 'ggtags-find-tag-dwim)
	      (setq ggtags-completing-read-function
		    (lambda (&rest args)
		      (apply #'ido-completing-read
			     (car args)
			     (all-completions "" ggtags-completion-table)
			     (cddr args))))
	      )))

; google style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; switch between header and source files.
add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

; Create Header Guards with f12
(global-set-key [f12]
  		'(lambda ()
  		   (interactive)
  		   (if (buffer-file-name)
  		       (let*
  			   ((fName (upcase (file-name-nondirectory (file-name-sans-extension buffer-file-name))))
  			    (ifDef (concat "#ifndef " fName "_H" "\n#define " fName "_H" "\n"))
  			    (begin (point-marker))
  			    )
  			 (progn
  					; If less then 5 characters are in the buffer, insert the class definition
			  (if (< (- (point-max) (point-min)) 5 )
			      (progn
			       (insert "\nclass " (capitalize fName) "{\npublic:\n\nprivate:\n\n};\n")
			       (goto-char (point-min))
			       (next-line-nomark 3)
			       (setq begin (point-marker))
			       )
			      )

  					;Insert the Header Guard
			  (goto-char (point-min))
			  (insert ifDef)
			  (goto-char (point-max))
			  (insert "\n#endif" " //" fName "_H")
			  (goto-char begin))
  			 )
					;else
		       (message (concat "Buffer " (buffer-name) " must have a filename"))
		       )
  		   )
  		)

(provide 'c-settings)
