import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers ( doFullFloat, isFullscreen )
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import System.IO

customRules = composeAll [ className =? "plasmashell" --> doIgnore ]

main = do
    let config' = kde4Config { modMask = mod4Mask
                             , focusedBorderColor="#ff00ff"
                             , handleEventHook = handleEvent'
                             , layoutHook = layout'
                             , manageHook = manage'
                             , normalBorderColor = "#000000"
                             , startupHook = spawnOnce "./.xmonad/startup.sh"
                             , terminal = "konsole"
                             , workspaces = workspaces'
                             }

    xmonad $ ewmh 
           $ (withUrgencyHook NoUrgencyHook) 
           $ config'

layout' = ( avoidStruts
          . smartBorders
          ) (layoutHook defaultConfig)

manage' = ( isFullscreen --> doFullFloat)
      <+> manageHook defaultConfig
      <+> customRules
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

