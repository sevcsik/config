;;; init.el -*- lexical-binding: t; -*-
;;
;; Author:  Henrik Lissner <henrik@lissner.net>
;; URL:     https://github.com/hlissner/doom-emacs
;;
;;   =================     ===============     ===============   ========  ========
;;   \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
;;   ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
;;   || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
;;   ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
;;   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
;;   ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
;;   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
;;   ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
;;   ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
;;   ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
;;   ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
;;   ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
;;   ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
;;   ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
;;   ||.=='    _-'                                                     `' |  /==.||
;;   =='    _-'                                                            \/   `==
;;   \   _-'                                                                `-_   /
;;    `''                                                                      ``'
;;
;; These demons are not part of GNU Emacs.
;;
;;; License: MIT

;; In the strange case that early-init.el wasn't loaded (e.g. you're using
;; Chemacs 1? Or you're loading this file directly?), we do it explicitly:
(unless (boundp 'doom-version)
  (load (concat (file-name-directory load-file-name) "early-init")
        nil t))

;; Ensure Doom's core libraries are properly initialized, autoloads file is
;; loaded, and hooks set up for an interactive session.
(doom-initialize)

;; Now we load all enabled modules in the order dictated by your `doom!' block
;; in $DOOMDIR/init.el. `doom-initialize-modules' loads them (and hooks) in the
;; given order:
;;
;;   $DOOMDIR/init.el
;;   {$DOOMDIR,~/.emacs.d}/modules/*/*/init.el
;;   `doom-before-init-modules-hook'
;;   {$DOOMDIR,~/.emacs.d}/modules/*/*/config.el
;;   `doom-init-modules-hook'
;;   $DOOMDIR/config.el
;;   `doom-after-init-modules-hook'
;;   `after-init-hook'
;;   `emacs-startup-hook'
;;   `doom-init-ui-hook'
;;   `window-setup-hook'
;;
;; And then we're good to go!
(doom-initialize-modules)

(setq auth-sources '("~/.authinfo"))

(add-hook 'eshell-mode-hook (lambda() (setenv "GIT_PAGER" "")
                                      (setenv "PAGER" "cat")
                                      (setenv "TERM" "dumb")))

;; Org mode GTD
(setq org-directory "~/Org")
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-todo-keywords
      '((sequence "TODO(t)" "DELEGATED(d)" "NEXT(n)" "HOLD(h)" "|" "DONE(x)")))
(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t%-6e% s")
        (todo . " %i %-12:c %-6e")
        (tags . " %i %-12:c")
        (search . " %i %-12:c")))


(use-package editorconfig :init (editorconfig-mode 1))

(use-package treemacs :init (treemacs-resize-icons 11))

(use-package org-jira
  :init
  (make-directory "~/.org-jira" t)
  (setq jiralib-url "https://gb-solutions.atlassian.net"))

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-enable-caching t)
  (setq projectile-globally-ignored-directories
        '("node_modules" "dist" "target" ".mvn"))
  (setq projectile-indexing-method 'native)
  (setq projectile-project-search-path '("~/Hobbi"))
  (setq projectile-switch-project-action #'projectile-commander)
  (projectile-register-project-type 'npm '("package.json")
    :project-file "package.json"
    :compile "npm run build"
    :test "npm test"
    :run "npm start"
    :test-suffix ".spec"))
  (projectile-mode t)
