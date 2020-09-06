{
  emacs,
  emacsPackagesGen,
  ...
}:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:[
  epkgs.melpaPackages.cider
  epkgs.melpaPackages.clojure-mode
  epkgs.melpaPackages.direnv
  epkgs.melpaPackages.emmet-mode
  epkgs.melpaPackages.evil
  epkgs.melpaPackages.nix-mode
  epkgs.melpaPackages.solarized-theme
])


