{ emacs, emacsPackagesGen, ... }:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:
  (with epkgs.melpaPackages; [
    ansible
    auth-source-xoauth2
    cider
    clojure-mode
    company-ansible
    direnv
    docker
    docker-compose-mode
    dockerfile-mode
    docker-tramp
    emmet-mode
    evil
    evil-collection
    fira-code-mode
    flycheck
    lsp-java
    lsp-treemacs
    lsp-ui
    magit
    mbsync
    nix-mode
    solarized-theme
    powershell
    typescript-mode
    tide
    treemacs
    treemacs-evil
    vterm
    yaml-mode
    vterm
  ]) ++
  (with epkgs.elpaPackages; [
    company
  ]))

