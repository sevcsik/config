{ emacs, emacsPackagesGen, ... }:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:
  (with epkgs.melpaPackages; [
    cider
    clojure-mode
    direnv
#    evil-magit
    emmet-mode
    evil
    flycheck
    magit
    nix-mode
    solarized-theme
    typescript-mode
    tide
  ]) ++
  (with epkgs.elpaPackages; [
    company
  ]))

