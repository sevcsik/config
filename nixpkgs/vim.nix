{
  nodePackages,
  stdenv,
  vim,
  vimPlugins,
  vim_configurable,
  ...
}:
let pkg = vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
        packages.myVimPackage = with vimPlugins; {
            start = [
                calendar-vim
                ctrlp-vim
                editorconfig-vim
                ranger-vim
                tsuquyomi
                vim-fugitive
                vim-gitgutter
                vim-javacomplete2
                vim-nix
                vim-orgmode
                vim-ps1
                vim-speeddating
                utl-vim
                yats-vim
            ];
        };
    };
};
in pkg.overrideAttrs (oldAttrs: { buildInputs = [ nodePackages.typescript ]; })
