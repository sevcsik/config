{ neovim.withNodeJs = true
; allowUnfree = true
; packageOverrides = super: let self = super.pkgs; in
#    { libuv = super.libuv.overrideAttrs
#        (oldAttrs: { version = "1.30.1"; })
#                   ; src = super.fetchFromGitHub { owner = "libuv"
#                                                 ; repo = "libuv"
#                                                 ; rev = "v1.30.1"
#                                                 ; sha256 = "1xlyc20fc41as5y2s9q958xfc8qgnvjkh0khll7brcycg596g25v"
#                                                 ; }
    { neovim = super.neovim.override { withNodeJs = true; }
#    ; neovim-unwrapped = super.neovim-unwrapped.overrideAttrs
#        (oldAttrs: { version = "0.4.0-20190806"
#                   ; patches = []
#                   ; src = super.fetchFromGitHub { owner = "neovim"
#                                                 ; repo = "neovim"
#                                                 ; rev = "f5d1e0e"
#                                                 ; sha256 = "1zlyc20fc41as5y2s9q958xfc8qgnvjkh0khll7brcycg596g25v"
#                                                 ; }
#                   ; }
#        )
    ; }
; }
