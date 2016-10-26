import XMonad
import XMonad.Config.Kde
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
    let config' = kde4Config { modMask = mod4Mask
                                , terminal = "termite"
                                , focusedBorderColor="#87D7FF"
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
              , "msg"
              , "msg2"
              ] ++ map show [5..7] ++
              [ "media"
              , "mixer"
              ]

