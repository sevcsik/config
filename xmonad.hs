import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import System.IO

main = do
    pipe <- spawnPipe "xmobar"
    let config' = defaultConfig { modMask = mod4Mask
                                , terminal = "gnome-terminal"
                                , focusedBorderColor="#888888"
                                , normalBorderColor = "#000000"
                                , layoutHook = layout'
                                , workspaces = workspaces'
                                , logHook = log' pipe
                                , manageHook = manage'
                                }

    xmonad $ withUrgencyHook NoUrgencyHook $ config'

log' pipe = dynamicLogWithPP xmobarPP
    { ppCurrent = xmobarColor "yellow" ""
    , ppUrgent = xmobarColor "red" ""
    , ppOutput = hPutStrLn pipe
    }

layout' = ( avoidStruts
          . smartBorders
          . layoutHook
          ) defaultConfig

manage' = manageHook defaultConfig <+> manageDocks 

workspaces' = [ "test" 
              , "dev"
              , "media"
              , "msg"
              , "msg2"
              ] ++ map show [5..9]

