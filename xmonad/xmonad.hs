-- imports
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.NoBorders

import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import qualified Data.Map as M

-- preferred terminal 
myTerminal = "urxvt"

-- border config
myNormalBorderColor  = "#93a1a1"
myFocusedBorderColor = "#b58900"
myBorderWidth        = 1

myWorkspaces = ["1","2","3","4","5","6"]

-- key bindings
myKeys x = [ 
    ((modMask x, xK_F1), shellPrompt defaultXPConfig)
  , ((modMask x, xK_F10), 
      spawn "notify-send -t 7000 \"Vim command reference\" \"`cat ~/.home/vim_cmd_ref.md`\"")
  , ((modMask x, xK_F11), spawn "notify-send -t 2000 \"`date`\"")
  , ((modMask x, xK_F12), xmonadPrompt defaultXPConfig)
  , (((modMask x .|. controlMask), xK_l), spawn "gnome-screensaver-command -l")
  ]

newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

-- manage hooks
myManageHook = composeAll [
        isFullscreen --> doFullFloat ]


-- status bar
-- cmd = "dzen2 "
-- pp = ""
-- myStatusBar conf = statusBar(cmd ++ flags) defaultPP  toggleStrutsKey conf
--   where 
--     fg = "'#839496'"
--     bg = "'#002b36'"
--     flags = "-e 'onstart=lower' -ta l -fg " ++ fg ++ " -bg " ++ bg
--     toggleStrutsKey XConfig{modMask = modm} = (modm, xK_y )


-- main = xmonad =<< myStatusBar defaults

-- experiment
-- main = xmonad defaults

main :: IO()
main = xmonad defaults

defaults = defaultConfig {
  terminal             = myTerminal
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , borderWidth        = myBorderWidth
    , workspaces         = myWorkspaces
    , keys               = newKeys
}


