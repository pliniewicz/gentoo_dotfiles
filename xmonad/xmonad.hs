-- imports
import XMonad
import Data.Monoid
import System.Exit
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Gaps
-- import XMonad.Layout.IndependentScreens
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myKeys = [ ("M-S-p", spawn "rofi -show run")
		, ("M-S-d", spawn "rofi -show drun")
		, ("M-w",   spawn "qutebrowser")
		, ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  		, ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
  		, ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
		] 
 
-- definitions
myTerminal = "urxvt"
myBorderWidth = 1
myModMask = mod4Mask -- windows key
myNormalBorderColor = "#dddddd"
myFocusedBorderColor = "#ff0000"
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myStartupHook = do
	spawnOnce "picom&"
	spawn "/home/patryk/.config/polybar/launch_polybar.sh&"
	spawn "feh --bg-scale ~/.wallpaper/wallpaper.jpg&"

myLayout = avoidStruts (gaps [(U,12), (D,12), (R,15), (L,15)] $ tiled ||| Mirror tiled ||| Full)
	where 
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- main
main :: IO()
main = do
	xmproc <- spawnPipe "/home/patryk/.config/polybar/launch_polybar.sh&"
	xmonad $ docks $ ewmh def
		{terminal = myTerminal
		,borderWidth = myBorderWidth
		,modMask = myModMask
		,layoutHook = myLayout
		,startupHook = myStartupHook
		,workspaces = myWorkspaces
		}
		`additionalKeysP` myKeys
