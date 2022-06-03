import XMonad ( xmonad
              , spawn
              , layoutHook
              , startupHook
              , modMask
              , mod4Mask
              , borderWidth
              , terminal
              , Tall(..)
              , Mirror(..)
              , Full(..)
              , (|||)
              );
import XMonad.Config.Gnome (gnomeConfig);
import XMonad.Config.Desktop (desktopConfig);
import XMonad.Layout.Spacing (spacingRaw, Border(..));
import XMonad.Actions.SpawnOn (spawnHere);
import XMonad.Hooks.EwmhDesktops (ewmh);
import XMonad.Util.EZConfig (additionalKeysP);

screenPadding = 20
windowMargin = 10

main = xmonad $ ewmh $ gnomeConfig
    { terminal = "kitty zsh"
    , borderWidth = 0
    , modMask  = mod4Mask
    , startupHook = do
                      spawnHere "picom -b --experimental-backends"
                      spawn "wal -Rq"
    , layoutHook =
        -- Window / Screen Padding
        spacingRaw True
            -- top bot rght lft
            (Border sp sp sp sp) True -- Screen
            (Border wm wm wm wm) True -- Windows
        $ Tall 1 (3/100) (1/2) ||| Full ||| Mirror (Tall 1 (3/100) (1/2))
    }
    `additionalKeysP`
    [ ("<XF86MonBrightnessUp>", spawn "light -s sysfs/backlight/acpi_video0 -A 5")
    , ("<XF86MonBrightnessDown>", spawn "light -s sysfs/backlight/acpi_video0 -U 5")
    ]
  where sp = screenPadding
        wm = windowMargin
