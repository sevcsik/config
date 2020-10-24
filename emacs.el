(add-to-list 'default-frame-alist '(font . "Fira Code Retina-8"))


(evil-mode 1)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (tide-hl-identifier-mode +1))
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save mode-enabled))
(setq tramp-default-method "ssh")
;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)


(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light-high-contrast)))
 '(custom-safe-themes
   (quote
    ("00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" default)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dokumentumok/Jegyzetek"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
