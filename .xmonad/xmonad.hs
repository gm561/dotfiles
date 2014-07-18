import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import System.IO
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run
import XMonad.Actions.CycleWS
import qualified Data.Map as M
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.SpawnOn
import qualified XMonad.StackSet as W

-- Define keys to add
keysToAdd x =
    [
        -- Close window
           ((modMask x, xK_c), kill)
        -- Shift to previous workspace
        ,  (((modMask x .|. controlMask), xK_Left), prevWS)
        -- Shift to next workspace
        ,  (((modMask x .|. controlMask), xK_Right), nextWS)
        -- Shift window to previous workspace
        ,  (((modMask x .|. shiftMask), xK_Left), shiftToPrev)
        -- Shift window to next workspace
        ,  (((modMask x .|. shiftMask), xK_Right), shiftToNext)
    ]

-- Define keys to remove
keysToRemove x =
    [
    ]

-- Delete the keys combinations we want to remove.
strippedKeys x = foldr M.delete (keys defaultConfig x) (keysToRemove x)

-- Compose all my new key combinations.
myKeys x = M.union (strippedKeys x) (M.fromList (keysToAdd x))

myManageHook = composeAll
    [
    	 className =? "chromium" --> doFloat
	,className =? "skype" --> doFloat
	,className =?  "Vlc" --> doFullFloat
    ]

xmobarEscape = concatMap doubleLts
  where doubleLts '<' = "<<"
        doubleLts x   = [x]

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape) $ ["1","2","3","4","5"]
  where
         clickable l = [ "<action=xdotool key alt+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                             (i,ws) <- zip [1..4] l,
                            let n = i ]

spawnToWorkspace :: String -> String -> X ()
spawnToWorkspace workspace program = do
                                      spawn program
                                      windows $ W.greedyView workspace

main = do
	xmproc <- spawnPipe "xmobar /home/grzes/.xmobarrc"
	xmonad $ defaultConfig  {
	manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , workspaces = myWorkspaces
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "yellow" "" . wrap "[" "]"
                        , ppHiddenNoWindows = xmobarColor "grey" ""
                        , ppTitle   = xmobarColor "green"  "" . shorten 40
                        , ppVisible = wrap "(" ")"
                        , ppUrgent  = xmobarColor "red" "yellow"
                        }
	,modMask = mod4Mask
--	,terminal = "termite"
	,terminal = "uxterm"
	,focusedBorderColor = "#00688B"
	,borderWidth = 1
	,keys = myKeys
	,handleEventHook = fullscreenEventHook
	,startupHook = do
		 setWMName "LG3D"
--		 spawnToWorkspace "1" "chromium"
--	         spawnToWorkspace "2" "emacs"
--		 spawnToWorkspace "5" "skype"
--		 spawnToWorkspace "5" "clementine"
	}
