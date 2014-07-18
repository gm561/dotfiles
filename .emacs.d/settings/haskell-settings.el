(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;ignore these files in completion
(add-to-list 'completion-ignored-extensions ".hi")


(provide 'haskell-settings)
