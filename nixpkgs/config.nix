{
    packageOverrides = pkgs: with pkgs; {
        myVim = import ./vim.nix pkgs;
    };
}
