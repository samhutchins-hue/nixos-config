{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # floats
      "match:class ^(Viewnior)$, float on"
      "match:class ^(Viewnior)$, center on"
      "match:class ^(Viewnior)$, size 1200 800"
      "match:class ^(imv)$, float on"
      "match:class ^(imv)$, center on"
      "match:class ^(imv)$, size 1200 725"
      "match:class ^(mpv)$, float on"
      "match:class ^(mpv)$, center on"
      "match:class ^(mpv)$, size 1200 725"
      "match:class ^(udiskie)$, float on"
      "match:class ^(waypaper)$, float on"
      "match:class ^(waypaper)$, pin on"
      "match:class ^(zenity)$, float on"
      "match:class ^(zenity)$, center on"
      "match:class ^(zenity)$, size 850 500"
      "match:class ^(org.gnome.Calculator)$, float on"
      "match:class ^(org.gnome.FileRoller)$, float on"
      "match:class ^(org.gnome.FileRoller)$, center on"
      "match:class ^(org.gnome.FileRoller)$, size 850 500"
      "match:class ^(org.pulseaudio.pavucontrol)$, float on"
      "match:class ^(pavucontrol)$, float on"
      "match:class ^(SoundWireServer)$, float on"
      "match:class ^(.sameboy-wrapped)$, float on"
      "match:class ^(rofi)$, pin on"
      "match:class ^(neovide)$, tile on"
      "match:class ^(Aseprite)$, tile on"
      "match:class ^(xdg-desktop-portal-gtk)$, dim_around on"

      # title-based floats
      "match:title ^(Transmission)$, float on"
      "match:title ^(Volume Control)$, float on"
      "match:title ^(Volume Control)$, size 700 450"
      "match:title ^(Volume Control)$, move 40 55%"
      "match:title ^(Firefox — Sharing Indicator)$, float on"
      "match:title ^(Firefox — Sharing Indicator)$, move 0 0"
      "match:title ^(Picture-in-Picture)$, float on"
      "match:title ^(Picture-in-Picture)$, pin on"
      "match:title ^(Open File)$, float on"
      "match:title ^(File Upload)$, float on"
      "match:title ^(File Upload)$, size 850 500"
      "match:title ^(branchdialog)$, float on"
      "match:title ^(Confirm to replace files)$, float on"
      "match:title ^(File Operation Progress)$, float on"

      # workspace assignments
      "match:class ^(firefox)$, workspace 1"
      "match:class ^(zen)$, workspace 1"
      "match:class ^(evince)$, workspace 3"
      "match:class ^(Gimp-2.10)$, workspace 4"
      "match:class ^(Aseprite)$, workspace 4"
      "match:class ^(Audacious)$, workspace 5"
      "match:class ^(Spotify)$, workspace 5"
      "match:class ^(com.obsproject.Studio)$, workspace 8"
      "match:class ^(discord)$, workspace 10"
      "match:class ^(WebCord)$, workspace 10"
      "match:class ^(vesktop)$, workspace 10"

      # idle inhibit
      "match:class ^(mpv)$, idle_inhibit focus"
      "match:class ^(firefox)$, idle_inhibit fullscreen"
      "match:class ^(zen)$, idle_inhibit fullscreen"

      # xwaylandvideobridge
      "match:class ^(xwaylandvideobridge)$, opacity 0.0 override"

      # fix XWayland scaling
      "match:xwayland true, rounding 0"

      # no gaps when only one window
      "border_size 0, match:float 0, match:workspace w[tv1]"
      "rounding 0, match:float 0, match:workspace w[tv1]"
      "border_size 0, match:float 0, match:workspace f[1]"
      "rounding 0, match:float 0, match:workspace f[1]"
    ];

    layerrule = [
      "match:namespace rofi, dim_around on"
      "match:namespace swaync-control-center, dim_around on"
    ];

    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
    ];
  };
}
