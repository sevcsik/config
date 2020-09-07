{ emacs, emacsPackagesGen, ... }:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:
  with epkgs.melpaPackages; [
    cider
    clojure-mode
    direnv
    evil-magit
    emmet-mode
    evil
    magit
    nix-mode
    solarized-theme
    typescript-mode
  ])

