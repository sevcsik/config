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
        customRC = ''
            set backspace=indent,eol,start
            set colorcolumn=120
            set encoding=utf-8
            set expandtab
            set list
            set listchars=tab:»\ ,trail:.
            set mouse=a
            set number
            set shiftwidth=4
            set tabstop=4

            let g:org_indent = 1
            let g:org_agenda_files = ['~/Dokumentumok/Jegyzetek/**/*.org']

            let g:JavaComplete_Home = '~/.cache/javacomplete2'
            if !isdirectory(g:JavaComplete_Home)
              call mkdir(g:JavaComplete_Home)
            endif
        '';
    };
};
in pkg.overrideAttrs (oldAttrs: { buildInputs = [ nodePackages.typescript ]; })
