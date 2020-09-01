{ stdenv, vim, vim_configurable, vimPlugins, ... }:
vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
        packages.myVimPackage = with vimPlugins; {
            start = [
                ctrlp-vim
                editorconfig-vim
                ranger-vim
                tsuquyomi
                vim-fugitive
                vim-javacomplete2
                vim-nix
                vim-ps1
                yats-vim
            ];
        };
        customRC = ''
            set expandtab
            set tabstop=4
            set shiftwidth=4
            set encoding=utf-8
            set colorcolumn=120
        '';
    };
}
