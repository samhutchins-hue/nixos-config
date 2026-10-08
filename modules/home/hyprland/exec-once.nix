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
    # waybar and swaync are replaced by caelestia (modules/home/caelestia.nix),
    # which starts from its own systemd user service on hyprland-session.target.
    # Both are still installed -- restore these two lines and set
    # programs.caelestia.systemd.enable = false to go back.
    #   "waybar &"
    #   "swaync &"
    "hyprctl setcursor Bibata-Modern-Classic 24 &"
    "init-wallpaper &"

    "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
  ];
}
