{
  emacs,
  emacsPackagesGen,
  ...
}:
(emacsPackagesGen emacs).emacsWithPackages (epkgs:[
  epkgs.melpaPackages.evil
  epkgs.melpaPackages.solarized-theme
])


