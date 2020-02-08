import Data.Map ( fromList )
import System.IO
import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers ( doFullFloat, isFullscreen )
import XMonad.Util.EZConfig ( additionalKeys )
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

customRules = composeAll [ className =? "plasmashell" --> doIgnore ]

rotateLeft = spawn
    (  "xrandr --output eDP-1 --rotate left && "
    ++ "xinput set-prop \"ELAN2097:00 04F3:2687\" --type=float \"Coordinate Transformation Matrix\" 0 -1 1 1 0 0 0 0 1"
    )

rotateNormal = spawn
    (  "xrandr --output eDP-1 --rotate normal && "
    ++ "xinput set-prop \"ELAN2097:00 04F3:2687\" --type=float \"Coordinate Transformation Matrix\" 0 0 0 0 0 0 0 0 0"
    )

keyMap = [ (( mod4Mask, xK_r), rotateLeft)
         , (( mod4Mask .|. shiftMask, xK_r), rotateNormal)
         , (( mod4Mask, xK_p), spawn "synapse")
         ]

main = do
    let config' = kde4Config { modMask = mod4Mask
                             , focusedBorderColor="#ff00ff"
                             , handleEventHook = handleEvent'
                             , layoutHook = layout'
                             , manageHook = manage'
                             , normalBorderColor = "#000000"
                             , startupHook = spawnOnce "./.xmonad/startup.sh"
                             , terminal = "nvim-qt term://zsh"
                             , workspaces = workspaces'
                             } `additionalKeys` keyMap

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

