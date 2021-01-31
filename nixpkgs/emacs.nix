{ emacs, emacsPackagesGen, ... }:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:
  (with epkgs.melpaPackages; [
    ansible
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
    magit
    nix-mode
    solarized-theme
    powershell
    typescript-mode
    tide
    vterm
    yaml-mode
    vterm
  ]) ++
  (with epkgs.elpaPackages; [
    company
  ]))

