{
    packageOverrides = pkgs: with pkgs; {
        myVim = import ./vim.nix pkgs;
        myEmacs = import ./emacs.nix pkgs;
    };
}
