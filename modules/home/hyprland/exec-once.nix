{ ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    "hyprlock"

    "nm-applet &"
    "poweralertd &"
    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
    "waybar &"
    "swaync &"
    "hyprctl setcursor Bibata-Modern-Ice 24 &"
    "awww daemon && awww img $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) --transition-type none &"

    "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
  ];
}
