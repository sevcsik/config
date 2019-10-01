let genymotionLibPath = pkgs: "${pkgs.stdenv.lib.makeLibraryPath (with pkgs; [ stdenv.cc.cc
                                                                               zlib
                                                                               glib
                                                                               xorg.libxcb
                                                                               xorg.libX11
                                                                               libxkbcommon
                                                                               xorg.libXmu
                                                                               xorg.libXi
                                                                               xorg.libXext
                                                                               libGL
                                                                               qt5.qtbase.bin
                                                                               qt5.qtbase.out
                                                                               qt5.qtwebsockets
                                                                             ])}";
in
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
  ; genymotion = super.genymotion.overrideAttrs 
      (oldAttrs: rec { name = "genymotion-${version}"
                     ; version = "3.0.2"
                     ; src = super.requireFile { url = https://www.genymotion.com/download/
                                               ; name = "genymotion-${version}-linux_x64.bin"
                                               ; sha256 = "d6f515c5c56eace0699b1d47da3ce569c55fdd5284d9e4f7ad47d209b39e9930"
                                               ; }
                     ; fixupPhase = ''
                          patchInterpreter() {
                            patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
                              "$out/libexec/genymotion/$1"
                          }
                          patchExecutable() {
                            patchInterpreter "$1"
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5WebSockets.so.5 ${self.qt5.qtwebsockets}/lib/libQt5WebSockets.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Network.so.5 ${self.qt5.qtbase.out}/lib/libQt5Network.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Core.so.5 ${self.qt5.qtbase.out}/lib/libQt5Network.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5QuickControls2.so.5 ${self.qt5.qtquickcontrols2}/lib/libQt5QuickControls2.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Quick.so.5 ${self.qt5.qtdeclarative}/lib/libQt5Quick.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Gui.so.5 ${self.qt5.qtbase.out}/lib/libQt5Gui.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Qml.so.5 ${self.qt5.qtdeclarative}/lib/libQt5Qml.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Widgets.so.5 ${self.qt5.qtbase.out}/lib/libQt5Widgets.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5Sql.so.5 ${self.qt5.qtbase.out}/lib/libQt5Sql.so.5
                            ${self.patchelfUnstable}/bin/patchelf "$out/libexec/genymotion/$1" --replace-needed libQt5DBus.so.5 ${self.qt5.qtbase.out}/lib/libQt5DBus.so.5
                            wrapProgram "$out/libexec/genymotion/$1" \
                              --set "LD_LIBRARY_PATH" "${(genymotionLibPath self)}"
                          }
                          patchTool() {
                            patchInterpreter "tools/$1"
                            wrapProgram "$out/libexec/genymotion/tools/$1" \
                              --set "LD_LIBRARY_PATH" "${(genymotionLibPath self)}"
                          }
                          patchExecutable genymotion
                          patchExecutable player
                          patchTool adb
                          patchTool aapt
                          patchTool glewinfo
                          #rm $out/libexec/genymotion/libxkbcommon*
                       ''
                     ; })
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
