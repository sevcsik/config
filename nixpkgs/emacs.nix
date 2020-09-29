{ emacs, emacsPackagesGen, ... }:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:
  (with epkgs.melpaPackages; [
    ansible
    cider
    clojure-mode
    company-ansible
    direnv
#    evil-magit
    emmet-mode
    evil
    fira-code-mode
    flycheck
    magit
    nix-mode
    solarized-theme
    typescript-mode
    tide
    yaml-mode
  ]) ++
  (with epkgs.elpaPackages; [
    company
  ]))

