import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

general = defaultConfig { modMask = mod4Mask
                        , terminal = "gnome-terminal"
                        }

borders = general { focusedBorderColor="#888888"
                  , normalBorderColor = "#000000"
                  , layoutHook = smartBorders $ layoutHook defaultConfig
                  }

workspaces' = borders { workspaces = [ "test" 
                                     , "dev"
                                     , "media"
                                     , "msg"
                                     ] ++ map show [5..9]
                      }

main = xmonad =<< xmobar workspaces'

