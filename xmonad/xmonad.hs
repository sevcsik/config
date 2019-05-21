import XMonad
import XMonad.Util.SpawnOnce

cfg = defaultConfig { modMask = mod4Mask 
                    , startupHook = spawnOnce "./.xmonad/startup.sh"
		    }

main = xmonad $ cfg
