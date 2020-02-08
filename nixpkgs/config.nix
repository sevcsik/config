{ neovim.withNodeJs = true
; allowUnfree = true
; packageOverrides = super: let self = super.pkgs; in
    { neovim = super.neovim.override { withNodeJs = true; }
    ; }
; }
