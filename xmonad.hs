import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers ( doFullFloat, isFullscreen )
import XMonad.Util.Run
import System.IO

main = do
    pipe <- spawnPipe "xmobar"
    let config' = defaultConfig { modMask = mod4Mask
                                , terminal = "lxterminal"
                                , focusedBorderColor="#55AA55"
                                , normalBorderColor = "#000000"
                                , layoutHook = layout'
                                , workspaces = workspaces'
                                , logHook = log' pipe
                                , manageHook = manage'
                                , handleEventHook = handleEvent'
                                }

    xmonad $ ewmh 
           $ (withUrgencyHook NoUrgencyHook) 
           $ config'

log' pipe = dynamicLogWithPP xmobarPP
    { ppCurrent = xmobarColor "yellow" ""
    , ppUrgent = xmobarColor "red" ""
    , ppOutput = hPutStrLn pipe
    }

layout' = ( avoidStruts
          . smartBorders
          ) (layoutHook defaultConfig)

manage' = ( isFullscreen --> doFullFloat)
      <+> manageHook defaultConfig
      <+> manageDocks 

handleEvent' = handleEventHook defaultConfig
           <+> docksEventHook
           <+> fullscreenEventHook

workspaces' = [ "test" 
              , "dev"
              , "media"
              , "msg"
              , "msg2"
              ] ++ map show [5..9]

